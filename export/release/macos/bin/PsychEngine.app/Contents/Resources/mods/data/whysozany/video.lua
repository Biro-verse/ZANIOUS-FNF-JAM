function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('zanious');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end