# audio_detection



 sudo docker run -it --device /dev/snd test:v1.0 /bin/bash



dockerとlocalhostの疎通
https://qiita.com/ijufumi/items/badde64d530e6bade382
1. localでAPIサーバーたてる
2. dockerコンテナでpingやarpでlocalのprivateIPを探す
2. curlで疎通確認


CUDA_VISIBLE_DEVICES=0 python3 pytorch/inference.py audio_tagging     --model_type="Cnn14"     --checkpoint_path="Cnn14_mAP=0.431.pth"     --audio_path="resources/R9_ZSCveAHg_7s.wav"     --cuda
