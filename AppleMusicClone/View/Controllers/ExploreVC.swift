
import UIKit

private let reuseIdentifier = "SearchCell"
private let headerReuseIdentifier = "SearchHeader"

class ExploreVC: UIViewController {
    
    //MARK: - Properties
    
    lazy var collectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 300), collectionViewLayout: UICollectionViewFlowLayout())
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.text = "Top Picks"
        return label
    }()
    
    private let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = iv.frame.width / 2
        iv.image = UIImage(systemName: "person.crop.circle")
        iv.tintColor = .red
        return iv
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNav()
        configureCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureUI()

    }
    
    //MARK: - Helpers
    
    func configureUI() {
        view.addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
        view.addSubview(profileImage)
        NSLayoutConstraint.activate([
            profileImage.centerYAnchor.constraint(equalTo: navigationController!.navigationBar.centerYAnchor, constant: 0),
            profileImage.widthAnchor.constraint(equalToConstant: 50),
            profileImage.heightAnchor.constraint(equalToConstant: 50),
//            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            profileImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12)
        ])

    }
    
    func configureNav() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Listen Now"
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    func configureCollectionView() {
        collectionView.backgroundColor = .black
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(SearchVCHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
    }
    
    //MARK: - Selectors
    
    @objc func goToProfile() {
        
    }
}


//MARK: - UICollectionView

extension ExploreVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchCell
        cell.backgroundColor = .lightGray
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension ExploreVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: view.frame.width / 3 + 80, height: 300)
        return size
    }
}
