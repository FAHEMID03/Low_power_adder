               build_phase()

                     |

           Get Virtual Interface

                     |

              Is Agent Active ?

             /                  \

            Yes                  No

             |                    |

        Create Driver           No Driver

       Create Sequencer        No Sequencer

             |

    Always Create Monitors


**Complete Agent Diagram**

                adder_agent

                     |

      -----------------------------------

      |                |               |

 Sequencer         Driver         Input Monitor

      |                |

      |                |

      ----------Virtual Interface---------

                     |

                    DUT

                     |

             Output Monitor



**
             Agent connection Enviorment **

                           ENV

                   |

            ----------------

            |              |

         Agent       Scoreboard

            |

   -----------------------------

   |            |             |

Driver      Input Mon     Output Mon

   |             |             |

Sequencer         |             |

                  -------------

                       |

                 Analysis Port

                       |

                  Scoreboard
