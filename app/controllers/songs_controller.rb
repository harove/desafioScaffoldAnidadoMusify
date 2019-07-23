class SongsController < ApplicationController
   def create
      @song = Song.new (song_params)
      @song.playlist = Playlist.find(params[:playlist_id])
      @song.save
      @playlist = @song.playlist

      if @song.save
         redirect_to playlist_path(@song.playlist), notice: 'La canción se ha creado con éxito'
      else
         render 'playlists/show'
      end
   end


   def destroy
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to playlist_path(@song.playlist), notice: 'la canción fué eliminada con éxito' 
   end
   
private
   def song_params
      params.require(:song).permit(:name, :artist)
   end




end




