class MultiMedia {
   String youtubeLink;
   String dropboxLink;
   String photoS3Path;

  MultiMedia({this.youtubeLink, this.dropboxLink, this.photoS3Path});

  String getYoutubeLink() {
    return youtubeLink;
  }

  String getDropBox() {
    return dropboxLink;
  }
}
