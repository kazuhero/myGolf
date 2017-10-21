class CoursesController < ApplicationController
  before_action :require_user_logged_in 
  
  def show
    @course = []
    
    result = RakutenWebService::Gora::Course.search(keyword: params[:keyword], latitude: params[:latitude], longitude: params[:longitude], searchRadius: 10) 
    
    course = Course.new(read(result.first)) 

    @name = course.name
    @address = course.address
    @description = course.description
    @url = course.url
    @image_url = course.image_url
    
  end
  
  def new
    @courses = [] 
 
    @keyword = params[:keyword] 
    @area = params[:area]
    
    results = RakutenWebService::Gora::Course.search({ 
      keyword: @keyword, 
      areaCode: @area, #未入力の場合は0:全都道府県で検索される
      hits: 20, 
    }) 
   
    results.each do |result| 
      # 扱い易いように Course としてインスタンスを作成する（保存はしない） 
      course = Course.new(read(result)) 
      @courses << course
    end

  end
  
  private
  
  def read(result) 
    course_code = result['golfCourseId'] 
    name = result['golfCourseName'] 
    address = result['address'] 
    description= result['golfCourseCaption'] 
    url = result['golfCourseDetailUrl'] 
    image_url = result['golfCourseImageUrl']
    latitude = result['latitude']
    longitude = result['longitude']
 
    return { 
      course_code: course_code, 
      name: name,
      address: address,
      description: description,
      url: url, 
      image_url: image_url, 
      latitude: latitude,
      longitude: longitude
    } 
  end 

end
