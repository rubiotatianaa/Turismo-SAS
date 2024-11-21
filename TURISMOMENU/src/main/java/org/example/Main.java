package org.example;

import java.util.Date;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("******TURISMOS/SAS*******");
        System.out.println("En Turismo por Antioquia, somos apasionados por mostrarte lo mejor de nuestra hermosa región. " +
                "Nos especializamos en crear experiencias inolvidables, conectándote con la naturaleza, la cultura y la gente de Antioquia.");


        // declarar variable

        String nombreYapellido;
        String edad;
        String documento;
        String ciudadResidencia;
        String telefono;
        String correo;
        String ciudadorigen;
        String ciudaddestino;
        String fechaida;
        String fecharegreso;
        String acompañante;
        String transporte;
        String registro;
        Boolean menu = true;

        do {
            System.out.println("*****MENÚ******");
            System.out.println("1.Sobre nosotros");
            System.out.println("2.Usuario");
            System.out.println("3.Viajes");
            System.out.println("4.Transporte");
            System.out.println("5.Guia:");
            System.out.println("6.Salir");
            System.out.print("Elige una opción: ");
            // Leer la opción del usuario
            int opcion = sc.nextInt();
            sc.nextLine();
            switch (opcion) {
                case 1:
                    System.out.println("****** TURISMOS/SAS *******");
                    System.out.println("En Turismo por Antioquia, somos apasionados por mostrarte lo mejor de nuestra hermosa región. Nos especializamos en crear experiencias inolvidables, conectándote con la naturaleza, la cultura y la gente de Antioquia.");
                    break;
                case 2:
                    System.out.println("Has seleccionado la opción Usuario.");
                    System.out.print("Ingrese sus nombres y apellidos:");
                    nombreYapellido = sc.nextLine();

                    System.out.print("Digita tu edad");
                    edad =sc.nextLine();

                    System.out.print("Digita tu telefono: ");
                    telefono=sc.nextLine();

                    System.out.print("Digita tu documento: ");
                    documento=sc.nextLine();

                    System.out.printf("Digita tu cuidad: ");
                    ciudadResidencia=sc.nextLine();

                    System.out.printf("Digita tu correo: ");
                    correo=sc.nextLine();

                    System.out.println(" Registro exitoso ");
                    break;
                case 3:
                    System.out.print("Has seleccionado la opción Viajes.");
                    System.out.println("Dita la ciudad de origen: ");
                    ciudadorigen=sc.nextLine();

                    System.out.print("Digita la ciudad destino: ");
                    ciudaddestino=sc.nextLine();

                    System.out.print("Digita la fecha de ida: ");
                    fechaida=sc.nextLine();

                    System.out.print("Digita la fecha de regreso: ");
                    fecharegreso=sc.nextLine();

                    System.out.println("Tu viaje esta programado");
                    break;
                case 4:
                    System.out.println("Has seleccionado la opción Transporte.");
                    System.out.println("-Moto");
                    System.out.println("-Avion");
                    System.out.println("-Barco");
                    System.out.println("Digita tu transporte de preferencia");
                    transporte= sc.nextLine();
                    System.out.println("Tu transporte ha sido elegido");


                    break;
                case 5:
                    System.out.println("Has seleccionado la opción Guía.");
                    System.out.println("Estos son tus guías");
                    System.out.println("1. Marta Rodriguez Gomez: Guia turistica enfocada en Turismo Natural y Turismo de Aventura.");
                    System.out.println("2.Juan Jose Restrepo Gomez: Guía turístico enfocado principalmente en Turismo cultural y Turísmo Gastronómico.");
                    System.out.println("3. Diego Martinez Ospina: Guía turístico principalmente me desempeño en Ecoturismo, y Turismo Rural.");
                    break;
                case 6:
                    System.out.println("Saliendo del menú...");
                    menu = false;
                    break;
                default:
                    System.out.println("Opción inválida. Por favor, intenta de nuevo.");
            }
            System.out.println();
        } while (menu == true);


    }
}
