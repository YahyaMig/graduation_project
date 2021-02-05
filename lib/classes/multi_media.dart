class MultiMedia {
  String youtubeLink = '';
  String dropboxLink = '';
  String zoomLink = '';
  String photoS3Path;

  MultiMedia(
      {this.youtubeLink, this.dropboxLink, this.photoS3Path, this.zoomLink});

  String getYoutubeLink() {
    return youtubeLink;
  }

  String getDropBox() {
    return dropboxLink;
  }

  String getZoom() {
    return this.zoomLink;
  }
}
