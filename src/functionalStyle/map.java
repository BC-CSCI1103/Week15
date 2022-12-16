public class Node<T> implements Map<T> {
    private string key;
    private T value;
    private Node<T> next;

    public Node(string key, T value, Node<T> next) {
        this.key = key;
        this.value = value;
        this.next = next;
    }

    public T find(string key) {
        if (compareTo(key, this.key) == 0)
            return this.value;
        else 
            return this.next.find(key);
        }

    public Map<T> add(string key, T value) {
        return new Node(key, value, this);
    }
}