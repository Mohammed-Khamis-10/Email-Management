class Mail {
  String? username;
  String? useravatar;
  String? subject;
  String? body;
  bool? starred;
  String? timeago;
  bool? seen;
  bool? file;
  String? filename;

  Mail(
      {this.username,
      this.useravatar,
      this.subject,
      this.body,
      this.starred,
      this.timeago,
      this.seen,
      this.file,
      this.filename});

  factory Mail.fromJson(Map<String, dynamic> data) {
    return Mail(
      username: data["username"],
      useravatar: data["useravatar"],
      subject: data["subject"],
      body: data["body"],
      starred: data["starred"],
      timeago: data["timeago"],
      seen: data["seen"],
      file: data["file"],
      filename: data["filename"],
    );
  }
}
