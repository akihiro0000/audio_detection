while :

do  
    /usr/local/bin/python3 /home/audio_detection/scripts/record_data.py > /dev/null 2>&1
    
    clear
    
    CUDA_VISIBLE_DEVICES=0 /usr/local/bin/python3 /home/audio_detection/pytorch/inference.py audio_tagging \
        --model_type="Cnn14" \
        --checkpoint_path="Cnn14_mAP=0.431.pth" \
        --audio_path="/home/audio_detection/resources/test.wav" \
        --cuda
        
done
