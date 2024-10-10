use_osc " 192.168.1.2", 4560
# Harmonic and Relaxing Sound with Choir Effects in Sonic Pi
use_real_time
live_loop :Quantum_Walk_31 do
  use_bpm 60  # Beats per minute
  music = sync "/osc*/play"
  rhythm = sync "/osc*/rhythm"
  
  define :sound do|root,type_1|
    with_fx :reverb do
      with_synth :mod_dsaw do
        play_chord chord(root,type_1), release: 8 ,attach: 3
      end
    end
  end
  music.each do |m|
    rhythm.each do|r|
      sound(m,:minor)
      sleep 2
    end
  end
end






