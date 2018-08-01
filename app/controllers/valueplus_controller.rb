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
  
  def myDonate
  end

  def myScrap
  end

  def myAssembly
  end

  def profileEdit
  end
  
  def check
      @assCheck = Assembly.where(:check => 2)
      #접근 권한 설정하기
  end 

  def list
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
  def profileUpdate
  end 
end
