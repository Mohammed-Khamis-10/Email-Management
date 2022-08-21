
import 'package:email_management/models/mail_model.dart';
import 'package:flutter/material.dart';

class MailWidget extends StatefulWidget {
  const MailWidget({required this.mail, Key? key}) : super(key: key);
  final Mail mail;

  @override
  State<MailWidget> createState() => _MailWidgetState();
}

class _MailWidgetState extends State<MailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:

                // if the useravatar dosnot exit ---> show background image

                widget.mail.useravatar != null
                    ? CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            NetworkImage(widget.mail.useravatar ?? ""),
                      )

                    // else show background image
                    : CircleAvatar(
                        radius: 25,

                        // calling the shuffled colors function we made below to colorize the avatar
                        backgroundColor:
                            mailColor(widget.mail.username?[0] ?? ""),
                        child: Text(
                          // to take the first character of the word
                          widget.mail.username?[0] ?? "",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    // to show the username from the data
                    widget.mail.username ?? "",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],

                        // to show the seen mail or not
                        fontWeight: widget.mail.seen ?? false
                            ? FontWeight.normal
                            : FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    // to show the subject from the data
                    widget.mail.subject ?? "",
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 13,
                        color: widget.mail.seen ?? false
                            ? Colors.grey
                            : Colors.grey[800],

                        // to show the seen mail or not
                        fontWeight: widget.mail.seen ?? false
                            ? FontWeight.normal
                            : FontWeight.bold),
                  ),
                ),

                Container(
                  child: Text(
                    // to show the body of the mail from the data
                    widget.mail.body ?? "",
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),

                //if file exist ---> show this container and if not make size box to shrinke on itself
                widget.mail.file ?? false
                    ? Container(
                        height: 30,
                        width: 120,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.grey.shade300)),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Icon(
                                Icons.image,
                                color: Colors.red,
                                size: 18,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Expanded(
                                  child: Text(
                                // to show the filename which is Assignment
                                widget.mail.filename ?? "",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey.shade700),
                              ))
                            ],
                          ),
                        ),
                      )

                    // if there is no file ---> shrink on your self
                    : const SizedBox()
              ],
            ),
          )),
          Column(
            children: [

              Text(
                widget.mail.timeago ?? "",
                style: TextStyle(
                  // to show the seen mail or not
                  fontSize: 13,
                  fontWeight: widget.mail.seen ?? false
                      ? FontWeight.normal
                      : FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon:

                      // if the icon have color
                      widget.mail.starred ?? false
                          ?
                          // show this icon
                          Icon(
                              Icons.star,
                              color: Colors.amber,
                            )

                          // else show this icon
                          : Icon(
                              Icons.star_border,
                            ))
            ],
          )
        ],
      ),
    );
  }

  Color mailColor(String name) {
    name = name.toUpperCase();

    if (name == "R" || name == "T") {
      return Color.fromARGB(255, 226, 171, 19);
    } else if (name == "L" || name == "M") {
      return Colors.lightBlue;
    } else if (name == "P" || name == "N") {
      return Colors.purpleAccent;
    } else if (name == "F" || name == "B") {
      return Colors.greenAccent;
    } else if (name == "O" || name == "G") {
      return Colors.redAccent;
    } else {
      return Color.fromARGB(255, 100, 116, 209);
    }
  }
}
