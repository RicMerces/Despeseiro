import 'package:despesas_pessoais/bloc/despesas_bloc.dart';
import 'package:despesas_pessoais/bloc/despesas_event.dart';
import 'package:despesas_pessoais/bloc/despesas_state.dart';
import 'package:despesas_pessoais/resources/colors_despeseiro.dart';
import 'package:despesas_pessoais/resources/strings_despeseiro.dart';
import 'package:despesas_pessoais/widgets/anotar_despesa.dart';
import 'package:despesas_pessoais/widgets/despesas_a_pagar.dart';
import 'package:despesas_pessoais/widgets/progress_depesas.dart';
import 'package:flutter/material.dart';

class PageDespesas extends StatefulWidget {
  const PageDespesas({Key? key}) : super(key: key);

  @override
  _PageDespesasState createState() => _PageDespesasState();
}

class _PageDespesasState extends State<PageDespesas> {
  late final DespesaBloc despesaBloc;

  @override
  void initState() {
    super.initState();
    despesaBloc = DespesaBloc();
    despesaBloc.inputDepesa.add(ReadDespesasEvent());
  }

  @override
  void dispose() {
    despesaBloc.inputDepesa.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controleTitulo = TextEditingController(text: '');
    TextEditingController controleValor = TextEditingController(text: '');
    return Scaffold(
      backgroundColor: ColorsDespeseiro.cor3,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorsDespeseiro.cor1,
        elevation: 0,
        toolbarHeight: 60,
        title: const Text(
          StringsDespeseiro.appDescription,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<DespesaState>(
          stream: despesaBloc.stream,
          builder: (context, AsyncSnapshot<DespesaState> snapshot) {
            final despesasList = snapshot.data?.despesas ?? [];

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      StringsDespeseiro.appAbbreviation,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      height: 158,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(237, 172, 200, 198),
                            // color: Colors.black.withOpacity(25),
                            spreadRadius: 2,
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProgressDepesas(
                            despesaRecent: despesasList,
                          )
                        ],
                      ),
                    ),
                    despesasList.isEmpty
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 100,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Center(
                                    child: Text(
                                      'Nenhuma despesa.',
                                      style: TextStyle(
                                        color: ColorsDespeseiro.cor4,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(
                                height: 40,
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return DespesasAPagar(
                                    bloc: despesaBloc,
                                    despesa: despesasList[index],
                                  );
                                }),
                                separatorBuilder: ((context, index) =>
                                    const SizedBox(
                                      height: 20,
                                    )),
                                itemCount: despesasList.length,
                              ),
                            ],
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: ColorsDespeseiro.cor1,
        onPressed: () {
          showModalBottomSheet(
            barrierColor: Colors.black.withOpacity(0.5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            context: context,
            builder: (BuildContext context) {
              return AnotarDespesa(
                bloc: despesaBloc,
                controleTitulo: controleTitulo,
                controleValor: controleValor,
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: ColorsDespeseiro.cor1,
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50,
        ),
      ),
    );
  }
}
