class SliderModel{
  String imagePath;
  String title;
  String desc;
  SliderModel({this.imagePath,this.desc,this.title});
  void setImageAssetPath(String getImagePath){
    imagePath = getImagePath;
  }
  void setTitle(String getTitle){
    title = getTitle;
  }
  void setDesc(String getDesc){
    desc = getDesc;
  }
  String getImageAssetPath(){
    return imagePath;
  }
  String getTitle(){
    return title;
  }
  String getDesc(){
    return desc;
  }

}
List<SliderModel> getSlides(){
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();
  //1
  sliderModel.setImageAssetPath("assets/three.png");
  sliderModel.setTitle("News Box");
  sliderModel.setDesc("Welcome to News Box, dive into the ocean of Information.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //2
  sliderModel.setImageAssetPath("assets/one.png");
  sliderModel.setTitle("Article");
  sliderModel.setDesc("Read any news in detail by just clicking on it.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //3
  sliderModel.setImageAssetPath("assets/two.png");
  sliderModel.setTitle("Location");
  sliderModel.setDesc("Get latest news in your hand wherever you are.");
  slides.add(sliderModel);

  sliderModel = new SliderModel();
  //4
  sliderModel.setImageAssetPath("assets/four.png");
  sliderModel.setTitle("Category");
  sliderModel.setDesc("Browse to your favourite category and read the full article.");
  slides.add(sliderModel);
  //5
  sliderModel = new SliderModel();
  //4
  sliderModel.setImageAssetPath("assets/five.png");
  sliderModel.setTitle("Wow !!");
  sliderModel.setDesc("You are all set to go !");
  slides.add(sliderModel);

return slides;


}