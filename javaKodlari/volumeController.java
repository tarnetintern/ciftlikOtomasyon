package com.example.volumeController;

import android.content.Context;
import android.media.AudioManager;

public class VolumeControl {

    private AudioManager audioManager;

    public VolumeControl(Context context) {
        audioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);
    }

    public void setVolume(int level) {
        audioManager.setStreamVolume(AudioManager.STREAM_MUSIC, level, 0);
    }

    public int getVolume() {
        return audioManager.getStreamVolume(AudioManager.STREAM_MUSIC);
    }
}
