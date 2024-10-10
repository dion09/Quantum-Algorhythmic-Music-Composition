use_osc " 192.168.1.2", 4560
use_bpm 60
use_real_time
live_loop :Grover do
  use_bpm 60
  music = sync "/osc*/Play_1"
  
  define :grover do|root , type|
    with_fx :reverb, room: 0.9  do
      with_synth :prophet do
        play_chord chord(root, type),attack: 3,attack_level: 1, decay: 0.6, sustain_level: 0.7 ,sustain: 1, release: 8
        sleep 8
      end
    end
  end
  
  music.each do |m|
    1.times do
      grover(m, :major)
      
    end
    
  end
end





























