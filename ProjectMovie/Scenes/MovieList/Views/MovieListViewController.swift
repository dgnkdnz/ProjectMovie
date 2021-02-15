//
//  MovieListViewController.swift
//  ProjectMovie
//
//  Created by Doğan Akdeniz on 12.02.2021.
//

import UIKit

class MovieListViewController: BaseViewController<MovieListPresenter>, MovieListViewProtocol {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchTextField: BaseTextField!
    @IBOutlet private weak var layoutButton: UIButton!
    
    // MARK: - Private Variables
    
    private let collectionViewCellNibName: String = "MovieListCollectionViewCell"
    private let collectionViewFooterCellNibName: String = "MovieListCollectionViewFooterCell"
    private let collectionViewCellReuseIdentifier: String = "MovieListCollectionViewCell"
    private let collectionViewFooterCellReuseIdentifier: String = "MovieListCollectionViewFooterCell"
    private var movies: [MovieListPresentation]!
    private var layoutOfCollectionView: CollectionViewLayouts!
    private var isHiddenLoadMoreButton: Bool!
    
    // MARK: - Public Variables
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.reloadMovie()
    }
    
    // MARK: - Initialization Methods
    
    override func prepare() {
        super.prepare()
        
        // Configure views
        self.searchTextField.layer.cornerRadius = 12
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.searchTextField.bounds.height))
        self.searchTextField.leftView = leftView
        self.searchTextField.leftViewMode = .always
        self.searchTextField.addTarget(self,
                                       action: #selector(MovieListViewController.searchTextFieldDidChangedValue),
                                       for: .editingChanged)
        self.searchTextField.attributedPlaceholder = NSAttributedString(string: NSLocalizedString("movieList.searchPlaceHolder", comment: ""), attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9176470588, green: 0.8862745098, blue: 0.7176470588, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        
        // Configure local variables
        self.movies = []
        self.layoutOfCollectionView = .twoColumn
        self.isHiddenLoadMoreButton = false
        
        // Configure Collection View
        self.collectionView.register(UINib(nibName: collectionViewCellNibName, bundle: nil),
                                     forCellWithReuseIdentifier: collectionViewCellReuseIdentifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.contentInsetAdjustmentBehavior = .never
        self.collectionView.collectionViewLayout = self.layoutOfCollectionView.getLayout(withFlowLayout: self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout, collectionViewWidth: self.collectionView.bounds.width)
        
    }
    
    // MARK: - MovieListViewProtocol Methods
    
    func handleOutput(_ output: MovieListPresenterOutput) {
        switch output {
        case .showMovies(let movieListPresentations):
            self.movies = movieListPresentations
            self.collectionView.reloadData()
        default:
            break
        }
    }
    
    // MARK: - Selectors
    
    @objc dynamic private func searchTextFieldDidChangedValue() {
        let keyword = self.searchTextField.text
        self.isHiddenLoadMoreButton = keyword?.count ?? 0 > 0
        self.presenter.search(withKeyword: keyword ?? "")
    }
    
    // MARK: - IBActions
    
    @IBAction private func layoutBtnTapped(_ sender: AnyObject) {
        self.layoutOfCollectionView = self.layoutOfCollectionView == CollectionViewLayouts.oneColumn
            ? CollectionViewLayouts.twoColumn
            : CollectionViewLayouts.oneColumn
        
        switch self.layoutOfCollectionView {
        case .oneColumn:
            self.layoutButton.setImage(UIImage(named: "icnGrid"), for: .normal)
        case .twoColumn:
            self.layoutButton.setImage(UIImage(named: "icnRow"), for: .normal)
        case .none:
            break
        }
        
        self.collectionView.reloadData()
        UIScreen.main.snapshotView(afterScreenUpdates: true)
        let layout = self.layoutOfCollectionView.getLayout(withFlowLayout: self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout, collectionViewWidth: self.collectionView.bounds.width)
        self.collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    // MARK: - Helper Methods
}

extension MovieListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewCellReuseIdentifier,
                                                          for: indexPath) as? MovieListCollectionViewCell,
            let movies = self.movies
        else {
            return UICollectionViewCell()
        }
        let movie = movies[indexPath.row]
        cell.configure(presentation: movie,
                       collectionViewLayout: self.layoutOfCollectionView)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind != UICollectionView.elementKindSectionFooter {
            return UICollectionReusableView()
        }
        
        self.collectionView.register(UINib(nibName: self.collectionViewFooterCellNibName, bundle: nil),
                                     forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                     withReuseIdentifier: collectionViewFooterCellReuseIdentifier)
        let footer = self.collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                          withReuseIdentifier: self.collectionViewFooterCellReuseIdentifier,
                                                                          for: indexPath) as! MovieListCollectionViewFooterCell
        footer.configure {
            self.presenter.loadMore()
        }
        footer.isHidden = self.isHiddenLoadMoreButton
        
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return CGSize(width: self.collectionView.bounds.width, height: 40.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.presenter.movieDetail(withIndex: indexPath.row)
    }
}
