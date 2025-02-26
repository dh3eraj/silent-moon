import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silent_moon/data/response/status.dart';
import 'package:silent_moon/model/counter/message_model.dart';
import 'package:silent_moon/res/api_strings.dart';
import 'package:silent_moon/res/app_colors.dart';
import 'package:silent_moon/res/widgets/custom_text_field.dart';
import 'package:silent_moon/view_model/counter/controllers/counter_view_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class UserChatScreen extends StatefulWidget {
  final int userId;

  const UserChatScreen({super.key, required this.userId});

  @override
  State<UserChatScreen> createState() => _UserChatScreenState();
}

class _UserChatScreenState extends State<UserChatScreen> {
  late final WebSocketChannel _channel;
  late List<MessageModel> _messages;
  late final TextEditingController _textEditingController;
  late final ScrollController _scrollController;
  late final CounterViewModel controller;

  @override
  void initState() {
    _channel = WebSocketChannel.connect(Uri.parse(ApiStrings.webSocket));
    _messages = [];
    _channel.sink.add("let,s coonect!");
    _textEditingController = TextEditingController();
    _scrollController = ScrollController();
    controller = Get.find();
    controller.getUserById(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Obx(() {
        switch (controller.userStatus.value) {
          case Status.loading:
            return Center(child: CircularProgressIndicator());
          case Status.loaded:
            return Scaffold(
              backgroundColor: AppColors.bgDay,
              appBar: AppBar(
                title: Text(controller.currentUser.firstName ?? ""),
                backgroundColor: AppColors.bgDay,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: StreamBuilder(
                        stream: _channel.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            _messages.add(
                              MessageModel(
                                message: snapshot.data,
                                datetime: DateTime.now(),
                                fromServer: true,
                              ),
                            );
                          }

                          return ListView.separated(
                            controller: _scrollController,
                            itemCount: _messages.length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment:
                                    _messages[index].fromServer == false
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    left: 25,
                                    top: 12,
                                    right: 25,
                                    bottom: 12,
                                  ),

                                  decoration: BoxDecoration(
                                    color:
                                        _messages[index].fromServer == false
                                            ? const Color(0xFF80F5F1)
                                            : AppColors.neutralNight200,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    _messages[index].message,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          _messages[index].fromServer == false
                                              ? AppColors.black
                                              : AppColors.neutralDay0,
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return SizedBox(height: 10);
                            },
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 20),
                    CustomTextField(
                      controller: _textEditingController,
                      hintText: "type message",
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (_textEditingController.text.trim().isNotEmpty &&
                              _textEditingController.text.trim() != "") {
                            _messages.add(
                              MessageModel(
                                message: _textEditingController.text.trim(),
                                datetime: DateTime.now(),
                                fromServer: false,
                              ),
                            );
                            _channel.sink.add(
                              _textEditingController.text.trim(),
                            );
                            _textEditingController.clear();
                            Future.delayed(Duration(milliseconds: 500), () {
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.linear,
                              );
                            });
                          }
                        },
                        icon: Icon(Icons.send),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            );
          case Status.error:
            return Center(child: Text("something went wrong"));
        }
      }),
    );
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}
