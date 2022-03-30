import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealWidget extends StatelessWidget {
  final Meal meal;
  const MealWidget({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(meal.imageUrl);
    return Builder(
      builder: (context) {
        return InkWell(
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    meal.title,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ),
          onTap: () {},
          splashColor: Colors.black,
        );
      },
    );
  }
}
