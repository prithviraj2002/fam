import 'package:fam/domain/big_card_cubit/big_card_cubit.dart';
import 'package:fam/domain/card_bloc/card_bloc.dart';
import 'package:fam/domain/card_bloc/card_events.dart';
import 'package:fam/domain/card_bloc/card_states.dart';
import 'package:fam/domain/model/hc1_model.dart';
import 'package:fam/domain/model/hc3_model.dart';
import 'package:fam/domain/model/hc5_model.dart';
import 'package:fam/domain/model/hc6_model.dart';
import 'package:fam/domain/model/hc9_model.dart';
import 'package:fam/presentation/components/hc5_card.dart';
import 'package:fam/presentation/components/hc9_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fam/presentation/components/hc3_card.dart';

import 'components/contextual_card.dart';
import 'components/hc1_card.dart';
import 'components/hc6_card.dart';
import 'utils/assets.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    final cardBloc = context.read<CardBloc>();

    //Use the below function to reset the visibility of big card hc3.
    // context.read<BigCardCubit>().resetVisibility();

    cardBloc.add(GetCards());
    return Scaffold(
      backgroundColor: const Color(0xffF7F6F3),
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: SvgPicture.asset(Assets.fampaySvg),
      ),

      //Here according to the card states, we build the ui.
      body: BlocConsumer<CardBloc, CardState>(builder: (ctx, state) {
        if (state is CardLoading) {
          //For loading state, circular progress indicator is rendered.
          return const Center(child: CircularProgressIndicator());
        } else if (state is CardError) {
          //For error state, error message is rendered.
          return Center(child: Text(state.errorMessage));
        } else if (state is CardData) {
          HC3? hc3Data = state.model.hc3Cards!;
          HC1? hc1Data = state.model.hc1Cards!;
          HC5? hc5Data = state.model.hc5Cards!;
          HC6? hc6Data = state.model.hc6Cards!;
          HC9? hc9Data = state.model.hc9Cards!;
          return RefreshIndicator(
              onRefresh: () async {
                cardBloc.add(GetCards());
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<BigCardCubit, bool?>(
                      builder: (BuildContext context, bool? state) {
                        //State corresponds to visibility of the big card hc3.
                        if (state != null && state) {
                          //If the state is true, big card hc3 is visible

                          //Now we check for isScrollable.
                          // If isScrollable is true, list view is built.
                          // If isScrollable is false, list view does not scroll.
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: SizedBox(
                              height: hc3Data.height != null
                                  ? double.parse(hc3Data.height.toString())
                                  : 600,
                              child: ListView.separated(
                                  physics: hc3Data.isScrollable!
                                      ? const BouncingScrollPhysics()
                                      : const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) {
                                    return ContextualCard(
                                      hcGroup: hc3Data,
                                      hc3: hc3Data.cards![index]!,
                                      cubit: context.read<BigCardCubit>(),
                                    );
                                    //return Hc3Card(card: hc3Data.cards![index], cubit: context.read<BigCardCubit>(),);
                                  },
                                  separatorBuilder: (ctx, index) {
                                    return const SizedBox(
                                      width: 12,
                                    );
                                  },
                                  itemCount: hc3Data.cards!.length),
                            ),
                          );
                        } else if (state == null) {
                          return Container();
                        } else {
                          return Container();
                        }
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    //Checks for hc6 cards scrollability.
                    //If scrollable, list view is rendered
                    //If not scrollable, list view does not scroll
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SizedBox(
                        height: 64,
                        // hc6Data!.height != null ? double.parse(hc6Data!.height.toString()) : 32,
                        child: ListView.separated(
                            physics: hc6Data.isScrollable!
                                ? const BouncingScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return ContextualCard(
                                hcGroup: hc6Data,
                                hc6: hc6Data.cards![index],
                                height: hc6Data.height != null
                                    ? double.parse(hc6Data.height.toString())
                                    : 32,
                              );
                              return Hc6Card(
                                card: hc6Data.cards![index],
                                height: hc6Data.height != null
                                    ? double.parse(hc6Data.height.toString())
                                    : 32,
                              );
                            },
                            separatorBuilder: (ctx, index) {
                              return const SizedBox(
                                width: 12,
                              );
                            },
                            itemCount: hc6Data.cards!.length),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    //Checks for hc5 cards scrollability.
                    //If scrollable, list view is rendered
                    //If not scrollable, list view does not scroll
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 160,
                        child: Center(
                          child: ListView.separated(
                              physics: hc5Data.isScrollable!
                                  ? const BouncingScrollPhysics()
                                  : const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) {
                                return ContextualCard(
                                  hcGroup: hc5Data,
                                  hc5: hc5Data.cards![index],
                                );
                                return Hc5Card(card: hc5Data.cards![index]);
                              },
                              separatorBuilder: (ctx, index) {
                                return const SizedBox(
                                  width: 12,
                                );
                              },
                              itemCount: hc5Data.cards!.length),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    //Checks for hc9 cards scrollability.
                    //If scrollable, list view is rendered
                    //If not scrollable, list view does not scroll.
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: SizedBox(
                        height: hc9Data.height != null
                            ? double.parse(hc9Data.height.toString())
                            : 195,
                        child: ListView.separated(
                            physics: hc9Data.isScrollable!
                                ? const BouncingScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) {
                              return ContextualCard(
                                hcGroup: hc9Data,
                                hc9: hc9Data.cards![index],
                              );
                              return Hc9Card(card: hc9Data.cards![index]);
                            },
                            separatorBuilder: (ctx, index) {
                              return const SizedBox(
                                width: 12,
                              );
                            },
                            itemCount: hc9Data.cards!.length),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),

                    //Checks for hc1 cards scrollability.
                    //If scrollable, list view is rendered
                    //If not scrollable, cards are rendered in the row.
                    hc1Data.isScrollable!
                        ? Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: SizedBox(
                              height: hc1Data.height != null
                                  ? double.parse(hc1Data.height.toString())
                                  : 64,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) {
                                    return ContextualCard(
                                      hcGroup: hc1Data,
                                      hc1: hc1Data.cards![index],
                                    );
                                    return Hc1Card(card: hc1Data.cards![index]);
                                  },
                                  separatorBuilder: (ctx, index) {
                                    return const SizedBox(
                                      width: 12,
                                    );
                                  },
                                  itemCount: hc1Data.cards!.length),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: SizedBox(
                                height: hc1Data.height != null
                                    ? double.parse(hc1Data.height.toString())
                                    : 64,
                                child: Wrap(
                                  runAlignment: WrapAlignment.spaceBetween,
                                  children: List.generate(hc1Data.cards!.length,
                                      (int index) {
                                    return ContextualCard(
                                      hcGroup: hc1Data,
                                      hc1: hc1Data.cards![index],
                                    );
                                    return Hc1Card(
                                      card: hc1Data.cards![index],
                                      width: MediaQuery.of(context).size.width *
                                          0.8 /
                                          hc1Data.cards!.length,
                                    );
                                  }),
                                )),
                          ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ));
        } else {
          return const Text("Something went wrong!");
        }
      }, listener: (ctx, state) {
        if (state is CardError) {
          //Shows a snackbar in case of an error.
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Something went wrong")));
        }
      }),
    );
  }
}
