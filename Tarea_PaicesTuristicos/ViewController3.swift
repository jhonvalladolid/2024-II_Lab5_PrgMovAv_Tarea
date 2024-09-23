//
//  ViewController3.swift
//  Tarea_PaicesTuristicos
//
//  Created by Mac05 on 23/09/24.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var destinoSeleccionado: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        mostrarRecurso()
    }

    // Función para mostrar el recurso en imageView
    func mostrarRecurso() {
        guard let destino = destinoSeleccionado else {
            print("No se ha recibido un destino válido.")
            return
        }

        // Lista de formatos de imagen soportados, incluyendo .avif
        let formatosSoportados = ["jpg", "png", "jpeg", "bmp", "gif", "avif"]

        var imagenCargada: UIImage?

        // Iterar sobre los formatos para encontrar la imagen
        for formato in formatosSoportados {
            if let direccionRecurso = Bundle.main.path(forResource: destino, ofType: formato, inDirectory: "RECURSOSPAICES") {
                imagenCargada = UIImage(contentsOfFile: direccionRecurso)
                break  // Detener el ciclo si se encontró un formato válido
            }
        }

        // Si se ha cargado una imagen, mostrarla en imageView
        if let imagen = imagenCargada {
            imageView.image = imagen
        } else {
            print("El recurso \(destino) no se encontró en ninguno de los formatos soportados.")
        }
    }

}
