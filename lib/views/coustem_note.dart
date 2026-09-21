import 'package:flutter/material.dart';

class CoustemNote extends StatelessWidget {
  const CoustemNote({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFCC80),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 12,
            bottom: 32,
            top: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  'Flutter tips',
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
                subtitle: Text(
                  'Bulid your app with Mo-Twab',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 22,
                  ),
                ),
                isThreeLine: true,
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 20.0,left: 30),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: Colors.black, size: 30),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'May21 , 2022',
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
