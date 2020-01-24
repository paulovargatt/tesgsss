import 'package:mobx/mobx.dart';
part 'audio_model.g.dart';

class AudioModel = _AudioModelBase with _$AudioModel;

abstract class _AudioModelBase with Store {
  
  @observable
  String title = '';
  @action
  changeTitle(val){
    return title = val;
  }
  
  @observable
  bool statusPlaying = false;
  @action
  changePlaying(bool value) => statusPlaying = value;

  
  @observable
  String image = 'https://blog.runrun.it/wp-content/uploads/2016/02/11_02.png';
  @action
  changeImage(val){
    print(val);
    return image = val;
  }

}