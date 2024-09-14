enum Sender { me, their }

class Message {
  final String text;
  final String? imageUrl;
  final Sender sender;

  Message({required this.text, this.imageUrl, required this.sender});
}
