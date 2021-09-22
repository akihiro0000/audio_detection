import pyaudio
import wave
from fastapi import FastAPI
import uvicorn

app = FastAPI()


form_1 = pyaudio.paInt16 # 16-bit resolution
chans = 1 # 1 channel
samp_rate = 44100 # 44.1kHz　サンプリング周波数
chunk = 4096 # 2^12 一度に取得するデータ数
record_secs = 3 # 録音する秒数
dev_index = 24 # デバイス番号
wav_output_filename = 'test.wav' # 出力するファイル


@app.get("/audio")
async def root():
    audio = pyaudio.PyAudio()

    stream = audio.open(format = form_1,rate = samp_rate,channels = chans, \
                    input_device_index = dev_index,input = True, \
                    frames_per_buffer=chunk)
    frames = []

    for i in range(0,int((samp_rate/chunk)*record_secs)):
        data = stream.read(chunk)
        frames.append(data)

    print("finished recording")

    stream.stop_stream()
    stream.close()
    audio.terminate()

    wavefile = wave.open(wav_output_filename,'wb')
    wavefile.setnchannels(chans)
    wavefile.setsampwidth(audio.get_sample_size(form_1))
    wavefile.setframerate(samp_rate)
    wavefile.writeframes(b''.join(frames))
    wavefile.close()

    return wavefile

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
