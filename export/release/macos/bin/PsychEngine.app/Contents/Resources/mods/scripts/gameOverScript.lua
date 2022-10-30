function onCreate()
  setPropertyFromClass('GameOverSubstate', 'characterName', 'Butcher-dead'); -- your character's json file name
  setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); -- sound to play when the death screen is triggered
  setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); -- song that will play during the death screen
  setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --sound to play when you press the confirm button to retry
end
