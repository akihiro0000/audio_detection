import urllib.request
import json
import wave

url = 'http://172.17.0.1:8000/audio'

with urllib.request.urlopen(url) as response:
        body = json.loads(response.read())
        frames = []
        for frame in body["frame"]:
                frames.append(frame.encode("latin-1"))
             
wavefile = wave.open(wav_output_filename,'wb')
wavefile.setnchannels(chans)
wavefile.setsampwidth(body["sample_size"])
wavefile.setframerate(samp_rate)
wavefile.writeframes(b''.join(frames))
wavefile.close()
