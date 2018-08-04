class ValueplusController < ApplicationController
  def index
    #마감된 집회 제외 추천순으로 저장
    assembly = Assembly.where(["assemblies.calendar >= ?", Date.today]).order(like: :desc)
    #carousel에 들어갈 상위 4개 집회 추출
    @carousel = assembly.limit(4)
    #분야별 추천수 상위 4개 집회
    @politic = assembly.where(:category => 0).limit(4)
    @society = assembly.where(:category => 1).limit(4)
    @education = assembly.where(:category => 2).limit(4)
  end
  def show
    assembly = Assembly.includes(:address).find(params[:assembly_id])
    @fullAddress = Address.find_by_assembly_id(params[:assembly_id])
  end
  #집회 등록 action
  def create 
  end
  #집회 등록 view 
  def new
  end
  def destroy
  end
  #집회 수정 view
  def edit
  end
  #집회 수정 action
  def update
  end 

  def donate
  end

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
  
  # def myDonate
  # end
  # def myScrap
  # end
  # def myAssembly
  # end
  
  #profile 수정 뷰
  def profileEdit
    @profile = User.find(params[:user_id])
    @category = Category.find_by_user_id(params[:user_id])
    @ability = Ability.find_by_user_id(params[:user_id])
  end
  #profile 수정 액션
  def profileUpdate
    profile = User.find(params[:user_id])
    #@profile.profileImg =
    profile.matching = params[:matching]
    profile.introduce = params[:introduce]
    profile.save
    redirect_to '/valueplus/mypage/:user_id'
  end
  def mypage
    @myAssembly = Assembly.where(:user_id => params[:user_id])
    @myScrap = Scrap.where(:user_id => params[:user_id])
    @myDonate = Donation.where(:user_id => params[:user_id])
  end
  
  def check
      @assCheck = Assembly.where(:check => 2)
      #접근 권한 설정하기
  end 

  def list
    # @assembly => 집회
    @assembly = Assembly.includes(:address).where(["assemblies.calendar >= ?", Date.today])
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
        @assembly = @assembly.where(:addresses => {:sido => "서울"})
      when "gyeonggi"
        @assembly = @assembly.where(:addresses => {:sido => "경기"})
      when "incheon"
        @assembly = @assembly.where(:addresses => {:sido => "인천"})
      when "busan"
        @assembly = @assembly.where(:addresses => {:sido => "부산"})
      when "gangwon"
        @assembly = @assembly.where(:addresses => {:sido => "강원"})
      when "chungbuk"
        @assembly = @assembly.where(:addresses => {:sido => "충북"})
      when "sejong"
        @assembly = @assembly.where(:addresses => {:sido => "세종"})
      when "chungnam"
        @assembly = @assembly.where(:addresses => {:sido => "충남"})
      when "daejun"
        @assembly = @assembly.where(:addresses => {:sido => "대전"})
      when "gyeongbuk"
        @assembly = @assembly.where(:addresses => {:sido => "경북"})
      when "daegu"
        @assembly = @assembly.where(:addresses => {:sido => "대구"})
      when "ulsan"
        @assembly = @assembly.where(:addresses => {:sido => "울산"})
      when "gyeongnam"
        @assembly = @assembly.where(:addresses => {:sido => "경남"})
      when "junbuk"
        @assembly = @assembly.where(:addresses => {:sido => "전북"})
      when "junnam"
        @assembly = @assembly.where(:addresses => {:sido => "전남"})
      when "gwuangju"
        @assembly = @assembly.where(:addresses => {:sido => "광주"})
      when "jeju"
        @assembly = @assembly.where(:addresses => {:sido => "제주"})
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
