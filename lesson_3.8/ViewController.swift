//
//  ViewController.swift
//  lesson_3.8
//
//  Created by Akai on 12/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    var tasks: [Task] = [Task(image: "circle", task: "Купить хлеб"),
                         Task(image: "circle", task: "Помыть машину"),
                         Task(image: "circle", task: "Сделать домашку"),
                         Task(image: "circle", task: "Пройти новую тему"),
                         Task(image: "circle", task: "Убраться дома")]
    
    var filteredTasks: [Task] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "to do"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //toDoTableView.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    @objc func addButtonTap() {
        let alert = UIAlertController(title: "Новые задачи", message: "Доавьте новую задачу", preferredStyle: .alert)
        var textField = UITextField()
        alert.addTextField { alertTextField in textField = alertTextField }
        let addNewTask = UIAlertAction(title: "Добавить задачу", style: .cancel) { action in ()
            let task = Task(image: "circle", task: textField.text ?? "")
            self.tasks.insert(task, at: 0)
            self.filteredTasks = self.tasks
            self.toDoTableView.reloadData()
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel) { action in () }
        alert.addAction(addNewTask)
        alert.addAction(cancel)
        present(alert, animated: true)
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo_cell", for: indexPath) as! ToDoTableViewCell
        cell.doneImageView.image = UIImage(systemName: "circle")
        cell.taskLabel.text = tasks[indexPath.row].task
        
        print(tasks[indexPath.row].task)
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

/*
 Тестовое задание:
 Создать приложение заметки. Заметки выводятся в tableView. Ячейка состоит из Label (Title заметок) и ImageView (пустой квадратик). Добавить функцию добавления заметки через алерт конроллер. При нажатии на квадратик заменять картинку на квадратик с галочкой. Ячейки с галочками должны выстраиваться сверху.
 */
