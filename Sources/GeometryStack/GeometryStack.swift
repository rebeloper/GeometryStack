import SwiftUI

public enum GeometryStackAlignment {
    case leading(spacing: CGFloat?), trailing(spacing: CGFloat?), verticalCentered(spacing: CGFloat?)
    case top(spacing: CGFloat?), bottom(spacing: CGFloat?), horizontalCentered(spacing: CGFloat?)
    case deth
}

public struct GeometryStack<Content: View>: View {
    
    private var axis: GeometryStackAxis
    private var horizontalAlignment: HorizontalAlignment
    private var verticalAlignment: VerticalAlignment
    private var spacing: CGFloat?
    @ViewBuilder private var content: (GeometryProxy) -> Content
    
    public init(_ alignment: GeometryStackAlignment = .verticalCentered(spacing: nil), @ViewBuilder content: @escaping (GeometryProxy) -> Content) {
        switch alignment {
        case .leading(let spacing):
            self.axis = .vertical
            self.horizontalAlignment = .leading
            self.verticalAlignment = .center
            self.spacing = spacing
        case .trailing(let spacing):
            self.axis = .vertical
            self.horizontalAlignment = .trailing
            self.verticalAlignment = .center
            self.spacing = spacing
        case .verticalCentered(let spacing):
            self.axis = .vertical
            self.horizontalAlignment = .center
            self.verticalAlignment = .center
            self.spacing = spacing
        case .top(let spacing):
            self.axis = .horizontal
            self.horizontalAlignment = .center
            self.verticalAlignment = .top
            self.spacing = spacing
        case .bottom(let spacing):
            self.axis = .horizontal
            self.horizontalAlignment = .center
            self.verticalAlignment = .bottom
            self.spacing = spacing
        case .horizontalCentered(let spacing):
            self.axis = .horizontal
            self.horizontalAlignment = .center
            self.verticalAlignment = .center
            self.spacing = spacing
        case .deth:
            self.axis = .depth
            self.horizontalAlignment = .center
            self.verticalAlignment = .center
        }
        
        self.content = content
    }
    
    public enum GeometryStackAxis {
        case vertical, horizontal, depth
    }
    
    public var body: some View {
        GeometryReader { geometry in
            Group {
                switch axis {
                case .vertical:
                    VStack(alignment: horizontalAlignment, spacing: spacing) {
                        content(geometry)
                    }
                case .horizontal:
                    HStack(alignment: verticalAlignment, spacing: spacing) {
                        content(geometry)
                    }
                case .depth:
                    ZStack {
                        content(geometry)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}
