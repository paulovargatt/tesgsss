import 'package:mobx/mobx.dart';
import 'package:vargatt_audio/audio_model.dart';
part 'controller_audio.g.dart';

class ControllerAudio = _ControllerAudioBase with _$ControllerAudio;

abstract class _ControllerAudioBase with Store {
  
  var audioModel = AudioModel();

  @computed
  bool get playing{
    return audioModel.statusPlaying;
  }

  String statusOfPlay(){
      if(audioModel.statusPlaying){
        print(audioModel.statusPlaying);
        return 'Tocando';
      }else{
        return 'a Tocar';
      }
  }

}
