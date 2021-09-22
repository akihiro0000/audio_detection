
/usr/local/bin/python3 /home/audio_detection/scripts/test.py 

wget -O $CHECKPOINT_PATH https://zenodo.org/record/3987831/files/Cnn14_mAP%3D0.431.pth?download=1

CUDA_VISIBLE_DEVICES=0 /usr/local/bin/python3 /home/audio_detection/pytorch/inference.py audio_tagging \
    --model_type="Cnn14" \
    --checkpoint_path="Cnn14_mAP=0.431.pth" \
    --audio_path="/home/audio_detection/resources/test.wav" \
    --cuda
