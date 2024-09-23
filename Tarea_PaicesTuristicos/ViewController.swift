//
//  ViewController.swift
//  Tarea_PaicesTuristicos
//
//  Created by Mac05 on 23/09/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var Tabla: UITableView!
    // Lista de países
    let paises = ["Perú", "Francia", "Italia", "Japón"]

    override func viewDidLoad() {
        super.viewDidLoad()
        Tabla.dataSource = self
        Tabla.delegate = self
    }
    
    // Implementar la función prepare para pasar el país seleccionado al segundo ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaDosSegue" {  // Identificador del segue para ir a ViewController2
            let paisSeleccionado = sender as! Int
            let viewController2 = segue.destination as! ViewController2
            viewController2.paisSeleccionado = paises[paisSeleccionado]  // Pasa el país seleccionado
        }
    }

    // Número de filas en la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paises.count
    }
    
    // Configuración de cada celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = UITableViewCell(style: .default, reuseIdentifier: "Celda")
        celda.textLabel?.text = paises[indexPath.row]
        return celda
    }
    
    // Acción al seleccionar un país
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let paisSeleccionado = indexPath.row
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: paisSeleccionado)  // Inicia el segue
    }

}

