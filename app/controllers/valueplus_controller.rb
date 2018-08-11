class ValueplusController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :destroy, :edit, :update, :show, :mypage, :donate, :profileEdit, :profileUpdate, :mypage, :check, :afterSigningUp, :aftersigningUp_view]
  def index
    #마감된 집회 제외 추천순으로 저장
    assembly = Assembly.where(["assemblies.calendar >= ?", Date.today]).where(:check => 1).order(like: :desc)
    #carousel에 들어갈 상위 4개 집회 추출
    @carousel = assembly.limit(4)
    #분야별 추천수 상위 4개 집회
    @politic = assembly.where(:category => 0).limit(4)
    @society = assembly.where(:category => 1).limit(4)
    @education = assembly.where(:category => 2).limit(4)
  end
  #집회 상세보기
  def show
    @assembly = Assembly.find(params[:assembly_id]) 
    @donateMoney = Donation.where(:assembly_id => params[:assembly_id]).sum(:donateUser)
    #집회분야가 한글로 표시된 변수
    @assemblyCategory = caseCategory(@assembly.category)
    #집회 주소
  end
  #집회에서 분야가 숫자로 저장되기 때문에 이를 한글로 반환하는 메소드
  def caseCategory(category)
    case category
      when 0
        return "정치"
      when 1
        return "사회"
      when 2
        return "교육"
      when 3 
        return "노동"
      when 4
        return "식품/의료"
      when 5
        return "언론"
      when 6
        return "환경"
      when 7
        return "인권"
      when 8
        return "여성"
      else
    end
  end
  #집회 등록 action
  def create 
    assembly = Assembly.new
    assembly.user_id = params[:user_id]
    assembly.title = params[:title]
    assembly.content = params[:content]
    assembly.calendar = params[:calendar]
    assembly.purpose = params[:purpose]
    assembly.donateDeadline = params[:donateDeadline]
    assembly.donateGoal = params[:donateGoal]
    assembly.category = params[:category]
    assembly.check = params[:check]
    assembly.roadAddress = params[:roadAddress]
    assembly.specificAdd = params[:specificAdd]
    assembly.sido = params[:sido]
    assembly.save
    
    host = Host.new
    host.assembly_id = assembly.id
    host.name = params[:name]
    host.email = params[:email]
    host.intro = params[:intro]
    host.save
    
    redirect_to "/valueplus/show/#{assembly.id}"
  end
  #집회 등록 view 
  def new
  end
  #집회 수정 view
  def edit
    @assembly = Assembly.includes(:host).find(params[:assembly_id])
    @category = Category.find_by(params[:assembly_id])
  end
  #집회 수정 action
  def update
    assembly = Assembly.find(params[:assembly_id]) 
    assembly.title = params[:title]
    assembly.content = params[:content]
    assembly.calendar = params[:calendar]
    assembly.purpose = params[:purpose]
    assembly.donateDeadline = params[:donateDeadline]
    assembly.donateGoal = params[:donateGoal]
    assembly.category = params[:category]
    assembly.check = params[:check]
    assembly.roadAddress = params[:roadAddress]
    assembly.specificAdd = params[:specificAdd]
    assembly.sido = params[:sido]
    assembly.save

    host = Host.find_by_assembly_id(params[:assembly_id])
    host.name = params[:name]
    host.email = params[:email]
    host.intro = params[:intro]
    host.save
    
    redirect_to "/valueplus/show/#{assembly.id}"
  end 
  def destroy
    assembly = Assembly.find(params[:assembly_id]) 
    assembly.destroy
    
    host = Host.find_by_assembly_id(params[:assembly_id])
    host.destroy 
    
    redirect_to '/valueplus/list'
  end
  #후원하기 뷰
  def donate_view
    @assembly = Assembly.find(params[:assembly_id])
  end
  #후원하기 액션
  def donate
    donate = Donation.new
    donate.donateUser = params[:donateUser]
    donate.user_id = current_user.id
    donate.assembly_id = params[:assembly_id]
    donate.save 
    
    redirect_to "/valueplus/mypage/#{current_user.id}"
  end
  #유저 매칭 뷰
  def match
    ability = $ability
    category = $category
    @userMatch = User.searchAbility(ability).searchCategory(category)
    #User.rb 에 메소드 정의 
    #능력과 분야별로 유저를 필터링하는 메소드
  end
  #사용자로부터 필터링을 위한 능력 및 분야를 받아 배열에저장하는 메소드
  def matchFilter
    ability_name = [:plan, :mc, :design, :video, :sns]
    category_name = [:politic, :society ,:education ,:labor ,:foodMedi ,:press ,:environment, :right ,:female]
    $ability = Array.new
    $category = Array.new
    ability_name.each do |a|
      if(params[a])
        $ability.push(params[a])
      end
    end
    category_name.each do |c|
      if(params[c])
        $category.push(params[c])
      end
    end
    redirect_to '/valueplus/match'
  end
  #profile 수정 뷰
  def profileEdit
    @user= User.find(params[:user_id])
    @category = Category.find_by_user_id(params[:user_id])
    @ability = Ability.find_by_user_id(params[:user_id])
  end
  #profile 수정 액션
  def profileUpdate
    user = User.find(params[:user_id])
    user.profile = params[:profile]
    user.matching = params[:matching]
    user.introduce = params[:introduce]
    user.save
    
    category = Category.find_by_user_id(params[:user_id])
    category.user_id = params[:user_id]
    category.politic = params[:politic]
    category.society = params[:society]
    category.education = params[:education]
    category.labor = params[:labor]
    category.foodMedi = params[:foodMedi]
    category.press = params[:press]
    category.environment = params[:environment]
    category.right = params[:right]
    category.female = params[:female]
    category.save
    
    ability = Ability.find_by_user_id(params[:user_id])
    ability.user_id = params[:user_id]
    ability.plan = params[:plan]
    ability.mc = params[:mc]
    ability.design = params[:design]
    ability.video = params[:video]
    ability.sns = params[:sns]
    ability.save
    
    redirect_to action: 'mypage', user_id: params[:user_id]
  end
  #내 후원, 스크랩, 내 집회,내 경력/이력 및 프로필을 볼 수 있는 마이페이지
  def mypage
    @user = User.find(params[:user_id])
    @category = Category.find_by_user_id(params[:user_id])
    @ability = Ability.find_by_user_id(params[:user_id])
    @myAssembly = Assembly.where(:user_id => params[:user_id])
    @myScrap = Assembly.includes(:scraps).where(:scraps => {:user_id => params[:user_id]})
    @myDonate = Donation.where(:user_id => params[:user_id])
    @myCareer = Career.where(:user_id => params[:user_id])
  end
  #커리어 등록 액션
  def myCareer
    myCareer = Career.new
    myCareer.content = params[:content]
    myCareer.user_id = current_user.id
    myCareer.save
    redirect_to :back
  end
  #커리어 수정 뷰
  def myCareerEdit
    @myCareer = Career.find(params[:career_id])
  end
  #커리어 수정 액션
  def myCareerUpdate
    myCareer = Career.find(params[:career_id])
    myCareer.content = params[:content]
    myCareer.save
    
    redirect_to action: 'mypage', user_id: current_user.id
  end
  #커리어 삭제 액션
  def myCareerDestroy
    myCareer = Career.find(params[:career_id])
    myCareer.destroy
    
    redirect_to :back
  end
  #검토하기 뷰
  def check
    unless current_user.admin == true
      redirect_to '/'
    end
      @check = Assembly.where(:check => 2)
  end 
  #검토 승인, 거부하는 액션
  def check_yes
    assembly = Assembly.find(params[:assembly_id])
    assembly.check = 1
    assembly.save
    
    redirect_to '/valueplus/check'
  end
  def check_no
    assembly = Assembly.find(params[:assembly_id])
    assembly.check = 0
    assembly.save
    
    redirect_to '/valueplus/check'
  end
  #전체 리스팅 페이지
  def list
    # @assembly => 집회
    @assembly = Assembly.where(["assemblies.calendar >= ?", Date.today]).where(:check => 1)
    case $field
      when "politic"
        @assembly = @assembly.where(:category => 0)
      when "society"
        @assembly = @assembly.where(:category => 1)
      when "education"
        @assembly = @assembly.where(:category => 2)
      when "labor"
        @assembly = @assembly.where(:category => 3)
      when "foodMedi"
        @assembly = @assembly.where(:category => 4)
      when "press"
        @assembly = @assembly.where(:category => 5)
      when "environment"
        @assembly = @assembly.where(:category => 6)
      when "right"
        @assembly = @assembly.where(:category => 7)
      when "female"
        @assembly = @assembly.where(:category => 8)
      else
    end
    case $sido
      when "seoul"
        @assembly = @assembly.where(:sido => "서울")
      when "gyeonggi"
        @assembly = @assembly.where(:sido => "경기")
      when "incheon"
        @assembly = @assembly.where(:sido => "인천")
      when "busan"
        @assembly = @assembly.where(:sido => "부산")
      when "gangwon"
        @assembly = @assembly.where(:sido => "강원")
      when "chungbuk"
        @assembly = @assembly.where(:sido => "충북")
      when "sejong"
        @assembly = @assembly.where(:sido => "세종")
      when "chungnam"
        @assembly = @assembly.where(:sido => "충남")
      when "daejun"
        @assembly = @assembly.where(:sido => "대전")
      when "gyeongbuk"
        @assembly = @assembly.where(:sido => "경북")
      when "daegu"
        @assembly = @assembly.where(:sido => "대구")
      when "ulsan"
        @assembly = @assembly.where(:sido => "울산")
      when "gyeongnam"
        @assembly = @assembly.where(:sido => "경남")
      when "junbuk"
        @assembly = @assembly.where(:sido => "전북")
      when "junnam"
        @assembly = @assembly.where(:sido => "전남")
      when "gwuangju"
        @assembly = @assembly.where(:sido => "광주")
      when "jeju"
        @assembly = @assembly.where(:sido => "제주")
      else
    end
    if $sort == "like"
      @assembly = @assembly.order(like: :desc)
    else
      @assembly = @assembly.order(id: :desc)
    end
  end
  #집회 추천순, 최신순 정렬
  def sort
    $sort = params[:sort]
    redirect_to '/valueplus/list'
  end
  #집회 분야별 필터링
  def field
    $field = params[:field]
    redirect_to '/valueplus/list'
  end
  #집회 지역별 필터링
  def sido
    $sido = params[:sido]
    redirect_to '/valueplus/list'
  end
  def aftersigningUp_view
  end
  #회원가입 직후 능력과 관심분야를 체크하는 액션
  def afterSigningUp
    category = Category.new
    category.user_id = params[:user_id]
    category.politic = params[:politic]
    category.society = params[:society]
    category.education = params[:education]
    category.labor = params[:labor]
    category.foodMedi = params[:foodMedi]
    category.press = params[:press]
    category.environment = params[:environment]
    category.right = params[:right]
    category.female = params[:female]
    category.save
    
    ability = Ability.new
    ability.user_id = params[:user_id]
    ability.plan = params[:plan]
    ability.mc = params[:mc]
    ability.design = params[:design]
    ability.video = params[:video]
    ability.sns = params[:sns]
    ability.save
    
    user = User.find(params[:user_id])
    user.matching = params[:matching]
    user.save
    
    redirect_to '/'
  end
end
