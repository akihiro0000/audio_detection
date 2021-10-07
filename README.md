# audio_detection



 sudo docker run -it --device /dev/snd test:v1.0 /bin/bash



dockerとlocalhostの疎通
https://qiita.com/ijufumi/items/badde64d530e6bade382
1. localでAPIサーバーたてる
2. dockerコンテナでpingやarpでlocalのprivateIPを探す
2. curlで疎通確認
