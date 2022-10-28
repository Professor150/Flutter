import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/models/style_calss.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deletetx;

  TransactionList(this.transaction, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  'Not Transaction Added Yet',
                  style: myText35(),
                  // style: Theme.of(context).textTheme.subtitle2,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  height: 200,
                  // child: Image.network(
                  //   'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASsAAACoCAMAAACPKThEAAAAh1BMVEX///8AAADFxcX7+/vIyMj4+Pjz8/Ps7OzW1tbp6em/v7+zs7OcnJzNzc3g4ODS0tKkpKS6urqKioqTk5Pj4+OBgYGenp7a2tqoqKgiIiIvLy91dXU5OTliYmJUVFRISEhsbGxBQUFmZmYUFBQxMTGMjIx6enpZWVlFRUUmJiYXFxdOTk4LCwvGOy46AAAaoklEQVR4nO1dZ5uiyhLuAslBERAUUcxj+P+/71Zo0HH33D1nZWfkebY+OMZmuqjwVuhupf7SX/pLf+kv/aW/9KfJz5RK8qPf87CmZ/U84vdTBak6AdKh12FLHDE3VZX3Our3kgFnawlMSY/DTnjEhTWFusdRv5nWEDXCKtj3N6qnh1yqC8T9DfutNPZgFUFLUW/jHtohpxEcexv1W2m8nUFx7ng17W3gRTemswQ76G3c76MMotvHuJsWbPoa2L2PWfkw2rt9DfxtZJ7BBf94n1dvpiV8GFNBU4LT08DfRjXkU5zKA6U9jbx/GNOYQgbrngb+LsKbP4Zr8cirhdnLyP7jmHkE/hKGDbPQ/d0iKMvHeYHRy9CrxyHPipSwp5G/h6wLqtwBXA2uNBztBTi6n9gPao5KCDe7j6G/h4hH7o0mwhQJs25eD0Nrb3HQQ3sNjBc93YZvIQMnMY+hM+32TP5OXh/a2Wl50rI6msGMHONQUZZJABRt1caS+cxbxVm+bt0114/oZ5mCBDYU81wGqoUp3/gV1DpwO7mtgI1eHdrUgCFpA50w4kvBQH0hcyhF9hw1ZEgbS0vB9tWxW8Bgp4G2Wyiy4xE9K/r437+aKp4M8mmqI5zkMmrBw6vY/SrDrNVtpHlVkBkkpT/18s9/LRViTwJOA4jmQdUq4YsBdJu1SMbQymxBTpBvRX+JjC8jxlSZyju5uo3hFOtJzl+L3bQqgzWF+NLx6qLYiax6msDXEVurJqOoTdurcwR5oif5D7Bh/JQriH7u1bqsRTADQ0DDhETNVlN6PriEA/un+GgSx8QPXgOosnaW+6eagtQYysWnN22ZtvnMsbrj1QSCrTwjLBfFfKXqz83qj5BNqnG1WemuptioFJYtdPwBNB7YJK9g/PhmyNl58/oU5t1zrE4FoaRmDPKHSekR524DS86Qsp2syZShu1j04IRuvYuil58Fq6a413nSzQ8WkfCZr13UXGHwVIlaxwTmDv7E/WcFf1s6MYial1xqkXjQx7DEtzqZmH36/p6qYbMnB7mDnYVi9eQ1g26IAvm0FNBgkSupvbOil72lXr+EvBt8mAgbRgyypDRIFjm68+ryqCmEwpQ5f7I1+K1SWfPPns2+p+5N0kZxrZz52ysEbvTeoPAo3nCPghzvgxWE3NOO1HHidBP9VHqZEK8mz3YZKDFlXT6z9SEdbdKQNrAk0eNNkbSi3IVfM8t+qEGrbCKMVpwO8EltFmSqzg+8eowKN4iQrBuZ53uG2fZPoMH4QwH2MR3K8uqSF8lt0cQLlR/zYWWT541ll6gd4gFDsrgrxj6zhxTposMCJB8xWZxZDer+5og4jb7uQQmd+f33W+ZbsKEH8Y3ZmqInawF9ZMi+iIqdPQuMEs6CrGrSkJzdV66C+2y7zNwVJM+8wodukACWxMMViWIHLx8yx2ebXxyIx5mU690GSidT7pCSyYGfunu1hpUg7B3p0YSDnsMsiO/T1QkUlI+K2ALR7ROvoKTfHMZ3rlb33wa2zRF0RahXCSId5SiCeZxN+yvY/mkKnKIeXdGENIY2LDlZIno2qWB8u09YrNMS6kh/CHfkjv5hx3wtg9a2Te+/3I+hZF6lM9JRedNI4WZVcWM23zHt36EoVBf3lOL0c22JTZytwezwF5A8FkFJACZw4s82ETzm6ohPKZu3oBRrnT/8MA8gZCnz8SszDUVo6PEsDEKVDQS7N/5qGUN0aKeKcuVQqgQt9TmmHMPjnBtlQSPwsiCM9NDNRu8J6EBjhkCrfvjZwt5Aw5CddNUVNwgEfcPiZl1ip99Grz9FNhrvMgS1QaVivYObi+FhMUUhC1im4vHyPut5ZEseOOA/DwMRS1fiHarAiXYPrKocggvOjZrfEvqRvE1eFvXRSG/ZahANf6R3zmJv49xKkaB9EOXgQXZayf03IvUoI3Xho0RNWV8fxYGNVUhByzmIH3+wdcSWjwK4ebkBTawz+iTHc7U80WVezul/BaHvQlNdEaYKpIi6KgMfHLQ5Ep8sXbga8EjrZBxZGxKyTxUe5o8flZFx+vT1IqhYa+f2Na5WBiSlLhAdSOezI96VgWRmUL8mOczImCQyx6asFOB0mmAtL3W+6ZFu9SRI/KQM8w8KfYNlXvpuNMJ3puunr6Ky6og5RcC6H4FZRQLacuJVNKO8Vh+FtT9OpDlopX1SP19qCHl6UVdSsYTRo0/SNpGS2M+oVJTm+yc6xSRTGTeqlXQvRld1G4kBzOmjmQEr/ie+mxO/JrzjbqEdmMFeDMIjogaqfgYU+J7ZDlX5LNv/wAgmFojVzz/7cCPGtwmH0AndC2Nigb++y1XjwY6y1gPA7iFaVRQZ8oZgbERQanyPcOSJNI9r6XCooXFq+AkJwkp+9hFU1gl8wrI1WyiHpMvwfC2wcCS5opyDn517bg//I1SHlDY481xGwqvgipaFBQHd2V7inglOc+G4aVXtPrOjbc/7kVG302iEd8A/65E02qdaUVDf5WqOAKVR2esF2z9PU2XHN1ix8dVylSzhLKFcpU6uJKBIAlZh7Sk7WV5+FCvp83+gD1spZ0K/nbERXBawc1iaCgS5ukLBvLrFG+oM95ffyoZ/RyZFNkfWIV2QSlASxhL2jpyM3f2aLHvD5r0IRkV5Tz50iZp7/vMj8EfqeNzCloxeLiPZhiPOsHA7cDJlBo9rNuzpANpAwhlFN+kDr3xqWWNYek1vC0V2uCSROPJ7PoFVJyvciN4ru3GIE5fUGEWRXe4hIi07sT1i0No4/kyQLmmj5tWBUzMjlL4kGQJud8BDJZk1D7wybtoFwgQd48xeIoqgVyl96cZTr6fzpUE9NQ8jVWh6nOlxwv1DBmnZmlEZMeZMgZFE5uRWA5G1lHmV4EdHYwh55OncO7M5J5HZiOLRU+YVz3VmZRKTBKRmZ35vScFgFJ8f9ca6JASztpJOIL5eROvGh63NUJdBh3PueCUuNsQbsbZ376+C9q4qOolK7rwy8o4v81HMEGvJwiVeYMcS8VST9woyYwe24Alzo2TAFipTmMIW3d50OlhyguuIH569zfsLVgIlqYbPuDr4uPOKprFku16nE64/S9IhlwQe+4LmaTA2SAGzfcpZiCOzNDDFHB55ALJ/mlei6DV9Kc7nb2+xaiho8pJVF00UXpHVubKfOlQL091B6vDEZ2LTGHU9F0E5nDSY7cLmivD8xhztxchJAgsH0Jgh4T8rGtcIoO+FnX2TMweLdGbCCLNcdbwKaF41m+lgA3VWjCPOht4kiN5wMbR5Go2mfrFFOPl7YeA0je3teUjgGHNOOcRAgnSJP9d0R8L4h9HejcawdGjWEhhLPYIndiQT1YifIj7uUbLcWhqn6PsRN288jUZfT22BBgX9KZYny0jRmHNigXl1su4CLCK4IV5trR96cd6NQthmFK9JqlNAFYvEnoKWpuwkhEKdxq6m4ynroPdhT37sTrf2kJtbaURKiiX4I2IXs59uSE28Sima0k5Eyh5LYvGHtXz3TMMWchYUkatcN/zQFGycHWfIpcWTy2FHFS8XqJe3IF2uvezHjJMzto4fXAE61lM7oxqzy6EfLys4shch/hsC8oWrS7rq3j69e7P7GkKawELSBLroQLidQQNnB24c8W6JYzXxNXfTZL1Fg1P/WHuxD0uo0G9+hDjSifMS0k7iEq+4Cdki9RtLAO7ceXVxqjfv37YXnJOEXCz2SlhG8SDXv9i2iK2piGM146writiGlPZH+0JYdLaHxgtJNHldz4gxRsagA0Vqw1lBqc/eBOLuJf0wffNMQ3bhaAx8CT+W8ofx9dxErvC6W5eMy5T05Sp5csLvwU8Xy1E/BH5y0UUx7vVgvWYHQg1qLMYgTJJEEMx5AQp+771bQGIJZcESJu2kJUPS7MUW//mjPCH3hhO6jDkdM0FoMdnrhOgnckSjVow1Li5xmlHZgrJ8O8KqXn3n1VquOufGtaR87h18M0L7Y6+pH18XnMXYCvqZjeA6IqXMyFbPOEss4HE6ITAPP+luQVWebdra2YncwYYTWzVVhCqMrtfWg6GqJOc156/MErTv38CCf00uxmp7qq9oXkmJQYrpG3W+hgZKU0xmXWoTIglb74a2Zv6TDPkM9sjuncfwiQOZXIMuFEh/1EByzzXgmOJ2F4pu0cF4aFp6RxrfbOqQKtplMh77J8nALMblJpzi0zFNZTaRdg+a/wfxzTJ+sidIDmO0QSl1R2pHMfZCfrzBbhzWO0m3ziX/4Eu2YUkdWFCZy/NbNzVElYpRRqyFlqtoQ48160Y9CZqQck4+4/XjiDSziZe8kO0Ktkp/xENNqUZo5UjFbjF9/1qk6DHnHnIwnIYrXY9ei78dSzXnGtkVtSEF7928PXZpjeCpAL2kSDIpEvdOgzPOITpCEqIa5Tk3HG2rZEmGytugvvxoitGCGXOP+2UTzsf4KTUeHQufYFqYJhNGEBIPgF6AWYcj7muw12/NK8ULQFADI6k3yKpwSX1OAqjmt2Ry9ilqqUKgnPFquier8zM+aXI8ipwW0XaGirjJwEd3MEKkMCnQuC+47IgixpfRtZ88JUDyodQh+8qJ/wZRLXULkQQdU8GkUv4kRdlFC8O4xiuoDbjiG3sDLpPyV21416O/4jAyOUKxQv9W+ac0ul1qadvVjnalG3fD6d66UH7HfmvMoLh1EYGi7hqqBTQwRjRIunYuesB5EMAVXReKyNy5orb8Yk5WbAvGP5UcO4fuqSjAJY2LpF7EdybVih9UEG/fHFwJTWCFrNFF87164BVNharnyW5lXRbxHIIYzboPH7+eFUoMOcS4gk1xA7s6qQYK4lXB6i13xNAlRf8KUfrm4Eoo5U6qUhKVnOCV5SUwGjOvWAS8FLwTYqUpUCvVr00wLdOM4KBqqGLI7csqhU1MIaLHvBLl8/Ta59GCROy9AYNQziWbUP/f0g3D+dERAcZbxqnSmQ1ZieGhs3RQZspfDnqc2yra2YjWDUPzp2Fh4mDqEolpl8wiNeSu7FeXc34JVeB86HQJ8coXz0S8oqDt5km4oo4j5waZilD/RtdfjWnfXMRuCfrYhRlWkoZPGatzj0gtJQ95H842xYvnywDWAzSLjNYgaTsrjVQMsEYcumVsVLYqm6AEaoFKf7VUvNRfzDGEajKLy4IJ58J41ZeArFKvGL+SwKFxf3fAgFQ3dMNXuitRyXo4estgO++y6lQEqLxuzfuvWvD0sgl7f3HwuWyT6JDiLZlX0qkWqw1fknNn43QIW/itONBbOAxGd7rGRwzyeSFTZBHzZI1X+B/XzYxEEE1izV6Wc3JKwdK3RXiVUHAdGEPg1bpgLZPVunO9MIuKUT6/lXC0K7wyF/8tI96IYWNe5byv2pEe564WVcF0Lt2dqT0EXl2lRpWxUzor2QeAmjIS7iuesdboJuHiP2V57aWIIevgmHke0hr0KZv2RPNKurJqtXzzKg5RLq3WAUsXLecjzVjGtBo8Z3lw4L5JivtfwPVY52yo2WNhsSUPKNE6Yixn6V3plopw11o1A+BVorhOPO2K7rLkeYfzmrGFoWryS/tNEAjNZctMlzAV+wxST66k5o5wbDqEbRpkD6GJLbe3lF0tMOgo2XQt2YK9tHqbzFOhOI1oIabKGWiR5WNe+Rwhnu1oAHKll446bD1W6iRTSBGdW8S1uUWrvV/K7hoslyS3CxNjKPElprJVGz6R1RoAulKiIqQSuZhYk5VwoU5logQGoT2+vTIV9hMspA3a8w0bRHw2Y16dZdOfd6/Pa2IPPmsns/EFunvxJGWrH9FWti/t+XLkrg4uBpnOZczDRypLGfbmsp3bQDaVYaPuKdNhbLCpZLeqUpk1z48MS/PSooYTQ1Kuq2ZuLs3dKG0z5pWh0e/4l8O8A3HsYToJ6cYRH2QNBFqYJbORmgzcV7YxsfZnQhpkBc2RIZgExfijZF7ZGv0OYxcs+lenKkoJIuRo4RNeA4FI68Ild8bepxdWrGUsVjFLbZBwLRA5ZAPzaqUy0flBLB9kXG6oYEuGa4q8+mDbMkec7RHWPlOgPP5lGuafacyNoJx9V7OE2+ArukSgLqThockV7QGsXFKyOMRGrph4nw+kKgXd6RtC0IhmeOM4Lf/9bLgkaFK5ShUbbB0VCK88VWf82bs3iwpN2DideWlXSn58xfsq4KuAfRRbkuz3AVbIPz1xAE573DNgmBCvdqjgJo4/GgyvZtTPEJFhijC2vYhDRzscklkP4V9kjP8/cbLLXBAssG5AI8ZsEQOOowy8uA39ngHy5ygkwypJAPRPZGfnFAPaMy7Z9bQQOWYnMUaXkUMjMCHAoJkiapSt9YB4ZTN2PqlceIUIIQNvAjeLtu746OMiBnu6EvW7hkwgXamg4fCcN58chg6GsLG50lWrKJTKHYpA5U7YVDkw76Nwl3LT8gkf92i2pONN4fj05ECueCi8OgqHGk8VentLK3KKiWykV/YSqp14FFqAurOV1EEOaqd0oTAbCmYIofS4z/w4OSjZAAtoAVeoceimh2mYc2qBoBZ5FSlPWtQQmQowha0aChYNoeha1EYcgVCLwdJC1MPr1IoeFmDFG8JnKcOFqW67wmFD6RtdoYUfRowzA1t4dZii8smigCaA5aZFPT3Yq4hD4yXZxIku4yB3St3YUKvjQGLn2d7y2NjSCpNSGyy94UvT54XI2S6a+yZbI4wJtA7OBpKTmW2VFAdpPXKt+8dcWfx96bPRR++jpbtEa4SimlcNsm0Yub7JlLd14l1lut3hUr0jSp+uXG8M1e4TVnQLJ47KG0J1EKkMlMWpyZKAYaT78+PelVB3AWx154Q5Jd+h0YM9H0DnB1Lp6ooKNz3mGjW4cqpbjyu29e5sI+kkOhEgPcvFZspaDaBTDcn3tHqMuC1K76Iz1U13r0bOHdnSvXvRTaI+7+itd6nGMGEYvCpsfR5EwdPQSnjTuzT1tq+z7CgKk3ZLQOormgqvEOymA+gWVZIzYYPucJzWnjFhtDrT01X0hlDWQptzESh+gTg0GMBOYZq4ecyUpkRtWGotWD0t6tN7PqV64/uYpXesu70wRO/nKl9BvE+0KVutJ/rgBE/vpNqPN99o1ZPNnJai9Yp7KQZ29pLBnknC/que11TJhrW95Pr0ep9S34fE0SJbM+MGRbyOWWkbb+uJ6QWYvQjWWouTYPabKH0iu7sP7DQhanQMs7hgqyJJd/orM2teH19zvdBhZik23ZTyTl+HjH4VfdCe6pPUlLsufn1nSQdxD7GaaPWk3XdbDCM1VvL2KK//+19KBzqKLA9GsmVYuwWvbEX7+omKpZZPba0Cwb6xF4+Tno6C/ErCIM0xNuPaEusuk7tY+mybFzGWhOZXU4vVWULDk5qVhjs4084npaJRsUH2hY715nsz8ZCvlnIYsG0s3WmFYssLJuKZcTS8Pg8m/yrakhFR6AyBXaLIE0XOIzHGL5Bs9m63+7WeRLO3CqyzYQ6lQ+ZOsRVt0GbZV7DY7Fo6jUX3nNb9XV7A1SYZ9pPZOUNPn3RItwYt47m3SXwR+bkKEQM5R3RO0qmm0wHU++isXwKkKehNSPfaGTryB1YWWvn50BCDohUejuzRUVAceGmPlhIXGL7g2N0WFcjxsmsJPpfIwjSGg7ra8TBS7R35sKH77yTUVUuA1LC0dREexWv4zaDNXMKRf+q1GsgW0fH4lMsPVaj1wPAV7aQDei3WlPzWKQskL96eU5L8prs6bjSSlaA5kRLFiBCWOyLWBQMpo3akE3BWIWgK5+VtHPGFr1VSvba4IYa9UtxdwstywDYkRzMwXumkpVaUDPVv6u90kaoXWM0r69BKTQI6vFZQm+5rGBqvUg2o7db7ncBEIFQLHuqBZLNue0xnG04FlM7bc1QHxqtca4gu4tAKtsmUO7ihlzPjpdQcOzAxUAFd7RGzQfJK6lCz+471lqKwNqfWRdi9nOCVgDCyb2Dvjfagy217ZwbmB69amu68QiRP8Co+Qw8pdwbqtC5/ZXvdmaC5ktMOh8YrKZ9jHNKec9ZWPgNeBfZiMydzx0iEP915KKkuH737VplPJL0fjdLdidBm47jVYPFaOMiHsZLw0NC7OXS8mrXud1jH8IqxJelpD95ofRS1Il9f1EIKAKK2nWHZ8apUOknz3tuKPhML0Y7KmZ0OavTA60Oal5IyKS2f7o4uztvWIlY9FuNh1SYarRN329494yLO7IViDsKFhhiet9I0eeDVVERtQMTIQHah1fNYtFUqnYkbz393eyqvlUl9MJPbHQ5DvGIlfB2TfCFF2nzozRlELQRytQ7dbo7/b4R/JHO91hLZdqp1mIEvyBwcEhgltsiuAu1xzofurNMOLhi/1f2at0ez2/NWudsTn9n98W0aUMadNnDXO3UVd/0I75ry+2R1gXcmHnapWg+rD7hvhmWw0Oqe9Tr59pRBt0s99NWrpu9CfT9+T5LHLG/DaNhWPItTe/vb095U5+P74pWGV4SlbvencnloerrInyZrvbnrmRYmWlvi96GDd9K8osyhPiC0xbd0kMIwOraV/fh/Hu9mt93JtqfLuHcx1TekK9Bmq4HBUSENqsjNjz9hhpepuIupbu2b3z9MVsNYavmJxFld6KmeXF9VYd0vz+n3u1HsaFitfUTOg4fK7iLWB8mSH2G9Pkp0ePx5JK0d7BWlTNHbIVuya4wsUdLedjBI4adUdl6wlbHe2tvV5i6m7Yqc3sb+DmoezLlAxv5O897eRVZfZ3CdDJ/o/OCfrF7hVdvOIDZKAMQQgUJHzqNqCK/6A4mC17T5kx0gexv7G0hO99QvuCDVY3OUrD/XS0n8B4UcJuWfABW9+L2k1c9p88Ar0fZh7Mnwc6L0aNO96hOJEh0eecWCNYBT1f+J4s8AsV8V1OCtW871AYPKWz1T8Fkt4NV+omdaPPLq6cYMjVaf4VTvc0l1XU1oCoOrzt/JflKK3sGiQwf13V/uh1ZFfaDkyYnDru91tXnXUUkUf0rLDItOT8Fs/y7d+Sy45WDyoc/kPJXpzD+gIOFnz1f17Dy+jMKvCPuPn5eAXwe3aELoOzYpMRcDVcLvIGdYfWp/6S/9pb/0Z+h/FCR6SH39E1IAAAAASUVORK5CYII=',
                  //   filterQuality: FilterQuality.high,
                  // ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transaction[index].amount}',
                            style: myText25(),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].name,
                      style: myText35(),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd().format(transaction[index].date),
                      style: myText20(),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () => deletetx(transaction[index].id),
                    ),
                  ),
                );
                // return Card(
                //   elevation: 6,
                //   child: Container(
                //     color: Colors.greenAccent,
                //     child: Row(
                //       children: [
                //         Container(
                //           margin: EdgeInsets.all(5),
                //           height: 60,
                //           decoration: BoxDecoration(
                //               color: Theme.of(context).primaryColor,
                //               border: Border.all(color: Colors.blue)),
                //           child: Center(
                //             child: Text(
                //               '\$${transaction[index].amount.toStringAsFixed(2)}',
                //               style: TextStyle(fontSize: 30),
                //             ),
                //           ),
                //         ),
                //         Container(
                //           color: Colors.greenAccent,
                //           margin: EdgeInsets.symmetric(horizontal: 40),
                //           child: Column(
                //             children: [
                //               Text(transaction[index].name),
                //               SizedBox(height: 10),
                //               Text(
                //                 DateFormat.yMMMEd()
                //                     .format(transaction[index].date),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // );
              },
              itemCount: transaction.length,
            ),
    );
  }
}
