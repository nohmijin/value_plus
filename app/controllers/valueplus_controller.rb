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
  end

  def check
  end

  def myCareer
  end

  def myDonate
  end

  def myScrap
  end

  def myAssembly
  end

  def profileEdit
  end

  def list
    @assembly = Assembly.includes(:address).where(["assemblies.calendar >= ?", Date.today])
    case $category
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
        @assembly = @assembly.address.where(:sido => "서울")
      when "gyeonggi"
        @assembly = @assembly.address.where(:sido => "경기")
      when "incheon"
        @assembly = @assembly.address.where(:sido => "인천")
      when "busan"
        @assembly = @assembly.address.where(:sido => "부산")
      else
    end
    if $sort == "like"
      @assembly = @assembly.order(like: :desc)
    end
  end
  #집회 추천순, 최신순 정렬
  def sort
    $sort = params[:sort]
    redirect_to '/valueplus/list'
  end
  #집회 분야별 필터링
  def category
    $category = params[:category]
    redirect_to '/valueplus/list'
  end
  #집회 지역별 필터링
  def location
    $sido = params[:sido]
    redirect_to '/valueplus/list'
  end
  def profileUpdate
  end 
  
end
