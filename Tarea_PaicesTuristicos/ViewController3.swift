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
        
        // Mostrar la imagen del recurso
        mostrarRecurso()
        
        // Agregar funcionalidad de zoom
        configurarZoomEnImagen()
    }

    // Función para mostrar el recurso en imageView
    func mostrarRecurso() {
        guard let destino = destinoSeleccionado else {
            print("No se ha recibido un destino válido.")
            return
        }

        if let recursosPath = Bundle.main.resourcePath?.appending("/RECURSOSPAICES"),
           let archivos = try? FileManager.default.contentsOfDirectory(atPath: recursosPath) {
            
            // Encontrar el archivo que comienza con el nombre del destino
            if let archivo = archivos.first(where: { $0.hasPrefix(destino) }),
               let imagen = UIImage(contentsOfFile: recursosPath + "/" + archivo) {
                imageView.image = imagen
            } else {
                print("No se encontró un archivo para \(destino).")
            }
        }
    }

    // Función para configurar el zoom en la imageView
    func configurarZoomEnImagen() {
        // Agregar el gesto de zoom (pinch gesture)
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(_:)))
        imageView.isUserInteractionEnabled = true  // Habilitar la interacción del usuario en imageView
        imageView.addGestureRecognizer(pinchGesture)
    }

    // Función para manejar el gesto de zoom
    @objc func didPinch(_ sender: UIPinchGestureRecognizer) {
        guard let viewToZoom = sender.view else { return }

        // Ajustar la escala de la vista con el gesto de pellizco
        viewToZoom.transform = viewToZoom.transform.scaledBy(x: sender.scale, y: sender.scale)

        // Reiniciar el escalado para que sea incremental
        sender.scale = 1.0
    }

}
