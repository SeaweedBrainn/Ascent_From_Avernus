using UnityEngine;

public class NPCWander : MonoBehaviour
{
    public float wanderRadius = 8f;
    public float moveSpeed = 2.5f;
    public float turnSpeed = 270f;
    public Transform player;
    public float keepDistanceFromPlayer = 1.5f;

    private Vector3 home;
    private Vector3 target;

    void Start()
    {
        home = transform.position;
        Animator animator = GetComponent<Animator>();
        if (animator != null) animator.applyRootMotion = false;
        PickNewTarget();
    }

    void Update()
    {
        Vector3 toTarget = target - transform.position;
        toTarget.y = 0f;

        if (toTarget.magnitude < 0.3f)
        {
            PickNewTarget();
            return;
        }

        Quaternion look = Quaternion.LookRotation(toTarget);
        transform.rotation = Quaternion.RotateTowards(transform.rotation, look, turnSpeed * Time.deltaTime);
        transform.position += transform.forward * (moveSpeed * Time.deltaTime);

        Vector3 p = transform.position;
        p.y = home.y;
        transform.position = p;
    }

    void PickNewTarget()
    {
        for (int i = 0; i < 10; i++)
        {
            Vector2 random = Random.insideUnitCircle * wanderRadius;
            Vector3 candidate = home + new Vector3(random.x, 0f, random.y);
            if (player != null && Vector3.Distance(candidate, player.position) < keepDistanceFromPlayer)
                continue;
            target = candidate;
            return;
        }
        target = home;
    }
}
