/**
 Trevor's add.
 DKContainer is copied from AnyDifferentiable.
 Mainly it is doing exactly the same thing plus it contains cellReuseId to identify cell type for rendering.
 For mor info about `AnyDifferentiable` see DifferenceKit->Sources
 */
import DifferenceKit
import UIKit

public struct DKContainer: Differentiable {
    
    /// Define this fromthe cell reuseID this will define how to render the cell.
    public var reuseID:String
    
    
    /// The value wrapped by this instance.
    @inlinable
    public var base: Any {
        return box.base
    }

    /// A type-erased identifier value for difference calculation.
    @inlinable
    public var differenceIdentifier: AnyHashable {
        return box.differenceIdentifier
    }

    @usableFromInline
    internal let box: DKContainerBox

    /// Creates a type-erased differentiable value that wraps the given instance.
    ///
    /// - Parameters:
    ///   - base: A differentiable value to wrap.
//    public init<D: Differentiable>(_ base: D) {
//        if let anyDifferentiable = base as? DKContainer {
//            self = anyDifferentiable
//        }
//        else {
//            box = DifferentiableBox(base)
//        }
//    }

    /// Trevor's add create container with reuseID
    public init<D: Differentiable>(_ base: D, reuseID:String) {
        if let anyDifferentiable = base as? DKContainer {
            self = anyDifferentiable
        }else {
            box = DifferentiableBox(base)
        }
        self.reuseID = reuseID
    }
    
    /// Indicate whether the content of `base` is equals to the content of the given source value.
    ///
    /// - Parameters:
    ///   - source: A source value to be compared.
    ///
    /// - Returns: A Boolean value indicating whether the content of `base` is equals
    ///            to the content of `base` of the given source value.
    @inlinable
    public func isContentEqual(to source: DKContainer) -> Bool {
        return box.isContentEqual(to: source.box)
    }
}

extension DKContainer: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "DKContainer(\(String(reflecting: base)))"
    }
}

@usableFromInline
internal protocol DKContainerBox {
    var base: Any { get }
    var differenceIdentifier: AnyHashable { get }

    func isContentEqual(to source: DKContainerBox) -> Bool
}

@usableFromInline
internal struct DifferentiableBox<Base: Differentiable>: DKContainerBox {
    @usableFromInline
    internal let baseComponent: Base

    @inlinable
    internal var base: Any {
        return baseComponent
    }

    @inlinable
    internal var differenceIdentifier: AnyHashable {
        return baseComponent.differenceIdentifier
    }

    @usableFromInline
    internal init(_ base: Base) {
        baseComponent = base
    }

    @inlinable
    internal func isContentEqual(to source: DKContainerBox) -> Bool {
        guard let sourceBase = source.base as? Base else {
            return false
        }
        return baseComponent.isContentEqual(to: sourceBase)
    }
}
