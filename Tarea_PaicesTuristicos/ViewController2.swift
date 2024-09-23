//
//  ViewController2.swift
//  Tarea_PaicesTuristicos
//
//  Created by Mac05 on 23/09/24.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var Tabla2: UITableView!
    
    var paisSeleccionado: String?  // El país seleccionado desde ViewController1
    var destinos: [String] = []  // Lista de destinos turísticos del país seleccionado

    override func viewDidLoad() {
        super.viewDidLoad()

        Tabla2.delegate = self
        Tabla2.dataSource = self

        // Definir destinos según el país seleccionado
        if paisSeleccionado == "Perú" {
            destinos = ["Machu Picchu", "Lago Titicaca", "Líneas de Nazca"]
        } else if paisSeleccionado == "Francia" {
            destinos = ["Torre Eiffel", "Museo del Louvre", "Mont Saint-Michel"]
        } else if paisSeleccionado == "Italia" {
            destinos = ["Coliseo", "Canales de Venecia", "Torre de Pisa"]
        } else if paisSeleccionado == "Japón" {
            destinos = ["Monte Fuji", "Templo Senso-ji", "Santuario Meiji"]
        }
    }

    // Número de filas en la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinos.count
    }

    // Configuración de cada celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style: .default, reuseIdentifier: "Celda")
        celda.textLabel?.text = destinos[indexPath.row]
        return celda
    }

    // Acción al seleccionar un destino
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinoSeleccionado = destinos[indexPath.row]
        self.performSegue(withIdentifier: "pantallaTresSegue", sender: destinoSeleccionado)  // Transición a ViewController3
    }

    // Preparar los datos para el tercer ViewController (ViewController3)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaTresSegue" {
            let destinoSeleccionado = sender as! String
            let viewController3 = segue.destination as! ViewController3
            viewController3.destinoSeleccionado = destinoSeleccionado  // Pasa el destino seleccionado
        }
    }

}
