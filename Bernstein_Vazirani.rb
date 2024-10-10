use_osc " 192.168.1.2", 4560
use_bpm 60
use_real_time
live_loop :Bernstein_Vazirani do
  use_bpm 60  # Beats per minute
  data = sync "/osc*/play_again"
  
  define :music do |element|
    with_fx :ping_pong, room: 0.9  do
      if element == '1'
        with_synth :hollow do
          play 60,pan: 1, attack: 1.5,attack_level: 0.7, decay: 1, sustain_level: 0.8,sustain: 1, release: 5
          sleep 0.5
        end
      end
      if element == '0'
        with_synth :dark_ambience do
          play 60 ,pan: -1, attack: 2 , attack_level: 0.7, decay: 0.8 ,sustain: 2, sustain_level: 1, release: 9
          sleep 0.5
        end
      end
    end
  end
  data.each do |d|
    1.times do
      music(d)
      puts"#{d}"
    end
  end
end

