import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_wedgit/user.dart';

class TypesButton extends StatelessWidget {
  const TypesButton({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('${user.name.toString()}'),
              Text('${user.email.toString()}'),
              Text('${user.phone.toString()}'),
              Text('${user.password.toString()}'),
              ElevatedButton(onPressed: () {}, child:  Text('elevate')),

              // Use an ElevatedButton with specific style to implement the
              // 'Filled' type.
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {},
                child: const Text('Filled'),
              ),

              // Use an ElevatedButton with specific style to implement the
              // 'Filled Tonal' type.
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      Theme.of(context).colorScheme.onSecondaryContainer,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondaryContainer,
                ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: () {},
                child: const Text('Filled Tonal'),
              ),

              OutlinedButton(onPressed: () {}, child: const Text('Outlined')),

              TextButton(onPressed: () {}, child: const Text('Text')),
            ],
          ),
        ),
      ),
    );
  }
}
