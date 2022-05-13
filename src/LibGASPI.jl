module LibGASPI

using ..GASPI: get_gaspi_library


@enum gaspi_operation_t::UInt32 begin
    GASPI_OP_MIN = 0
    GASPI_OP_MAX = 1
    GASPI_OP_SUM = 2
end

@enum gaspi_datatype_t::UInt32 begin
    GASPI_TYPE_INT = 0
    GASPI_TYPE_UINT = 1
    GASPI_TYPE_LONG = 2
    GASPI_TYPE_ULONG = 3
    GASPI_TYPE_FLOAT = 4
    GASPI_TYPE_DOUBLE = 5
end

const gaspi_number_t = Cuint

const gaspi_size_t = Culong

@enum gaspi_network_t::Int32 begin
    GASPI_NOT_USED = -1
end

struct gaspi_config_t
    group_max::gaspi_number_t
    segment_max::gaspi_number_t
    queue_num::gaspi_number_t
    queue_size_max::gaspi_number_t
    transfer_size_max::gaspi_size_t
    notification_num::gaspi_number_t
    passive_queue_size_max::gaspi_number_t
    passive_transfer_size_max::gaspi_size_t
    allreduce_buf_size::gaspi_size_t
    allreduce_elem_max::gaspi_number_t
    network::gaspi_network_t
    build_infrastructure::gaspi_number_t
    user_defined::Ptr{Cvoid}
end

@enum gaspi_return_t::Int32 begin
    GASPI_ERROR = -1
    GASPI_SUCCESS = 0
    GASPI_TIMEOUT = 1
    GASPI_QUEUE_FULL = 2
end

"""
    gaspi_config_get(config)

### Prototype
```c
gaspi_return_t gaspi_config_get ( gaspi_config_t *config );
```
"""
function gaspi_config_get(config)
    ccall((:gaspi_config_get, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_config_t},), config)
end

"""
    gaspi_config_set(config)

### Prototype
```c
gaspi_return_t gaspi_config_set ( gaspi_config_t const config );
```
"""
function gaspi_config_set(config)
    ccall((:gaspi_config_set, get_gaspi_library()), gaspi_return_t, (gaspi_config_t,), config)
end

const gaspi_timeout_t = Culong

"""
    gaspi_proc_init(timeout)

### Prototype
```c
gaspi_return_t gaspi_proc_init ( gaspi_timeout_t const timeout );
```
"""
function gaspi_proc_init(timeout)
    ccall((:gaspi_proc_init, get_gaspi_library()), gaspi_return_t, (gaspi_timeout_t,), timeout)
end

const gaspi_rank_t = Cuint

"""
    gaspi_proc_num(proc_num)

### Prototype
```c
gaspi_return_t gaspi_proc_num ( gaspi_rank_t *proc_num );
```
"""
function gaspi_proc_num(proc_num)
    ccall((:gaspi_proc_num, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_rank_t},), proc_num)
end

"""
    gaspi_proc_rank(rank)

### Prototype
```c
gaspi_return_t gaspi_proc_rank ( gaspi_rank_t *rank );
```
"""
function gaspi_proc_rank(rank)
    ccall((:gaspi_proc_rank, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_rank_t},), rank)
end

"""
    gaspi_proc_term(timeout)

### Prototype
```c
gaspi_return_t gaspi_proc_term ( gaspi_timeout_t const timeout );
```
"""
function gaspi_proc_term(timeout)
    ccall((:gaspi_proc_term, get_gaspi_library()), gaspi_return_t, (gaspi_timeout_t,), timeout)
end

"""
    gaspi_proc_kill(rank, timeout)

### Prototype
```c
gaspi_return_t gaspi_proc_kill ( gaspi_rank_t const rank , gaspi_timeout_t const timeout );
```
"""
function gaspi_proc_kill(rank, timeout)
    ccall((:gaspi_proc_kill, get_gaspi_library()), gaspi_return_t, (gaspi_rank_t, gaspi_timeout_t), rank, timeout)
end

"""
    gaspi_connect(rank, timeout)

### Prototype
```c
gaspi_return_t gaspi_connect ( gaspi_rank_t const rank , gaspi_timeout_t const timeout );
```
"""
function gaspi_connect(rank, timeout)
    ccall((:gaspi_connect, get_gaspi_library()), gaspi_return_t, (gaspi_rank_t, gaspi_timeout_t), rank, timeout)
end

"""
    gaspi_disconnect(rank, timeout)

### Prototype
```c
gaspi_return_t gaspi_disconnect ( gaspi_rank_t const rank , gaspi_timeout_t const timeout );
```
"""
function gaspi_disconnect(rank, timeout)
    ccall((:gaspi_disconnect, get_gaspi_library()), gaspi_return_t, (gaspi_rank_t, gaspi_timeout_t), rank, timeout)
end

@enum gaspi_state_t::UInt32 begin
    GASPI_STATE_HEALTHY = 0
    GASPI_STATE_CORRUPT = 1
end

const gaspi_state_vector_t = Ptr{gaspi_state_t}

"""
    gaspi_state_vec_get(state_vector)

### Prototype
```c
gaspi_return_t gaspi_state_vec_get ( gaspi_state_vector_t *state_vector );
```
"""
function gaspi_state_vec_get(state_vector)
    ccall((:gaspi_state_vec_get, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_state_vector_t},), state_vector)
end

const gaspi_group_t = Cushort

"""
    gaspi_group_create(group)

### Prototype
```c
gaspi_return_t gaspi_group_create ( gaspi_group_t *group );
```
"""
function gaspi_group_create(group)
    ccall((:gaspi_group_create, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_group_t},), group)
end

"""
    gaspi_group_add(group, rank)

### Prototype
```c
gaspi_return_t gaspi_group_add ( gaspi_group_t group , gaspi_rank_t const rank );
```
"""
function gaspi_group_add(group, rank)
    ccall((:gaspi_group_add, get_gaspi_library()), gaspi_return_t, (gaspi_group_t, gaspi_rank_t), group, rank)
end

"""
    gaspi_group_commit(group, timeout)

### Prototype
```c
gaspi_return_t gaspi_group_commit ( gaspi_group_t const group , gaspi_timeout_t const timeout );
```
"""
function gaspi_group_commit(group, timeout)
    ccall((:gaspi_group_commit, get_gaspi_library()), gaspi_return_t, (gaspi_group_t, gaspi_timeout_t), group, timeout)
end

"""
    gaspi_group_delete(group)

### Prototype
```c
gaspi_return_t gaspi_group_delete ( gaspi_group_t const group );
```
"""
function gaspi_group_delete(group)
    ccall((:gaspi_group_delete, get_gaspi_library()), gaspi_return_t, (gaspi_group_t,), group)
end

"""
    gaspi_group_num(group_num)

### Prototype
```c
gaspi_return_t gaspi_group_num ( gaspi_number_t *group_num );
```
"""
function gaspi_group_num(group_num)
    ccall((:gaspi_group_num, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), group_num)
end

"""
    gaspi_group_size(group, group_size)

### Prototype
```c
gaspi_return_t gaspi_group_size ( gaspi_group_t const group , gaspi_number_t *group_size );
```
"""
function gaspi_group_size(group, group_size)
    ccall((:gaspi_group_size, get_gaspi_library()), gaspi_return_t, (gaspi_group_t, Ptr{gaspi_number_t}), group, group_size)
end

"""
    gaspi_group_ranks(group, group_ranks)

### Prototype
```c
gaspi_return_t gaspi_group_ranks ( gaspi_group_t const group , gaspi_rank_t *group_ranks );
```
"""
function gaspi_group_ranks(group, group_ranks)
    ccall((:gaspi_group_ranks, get_gaspi_library()), gaspi_return_t, (gaspi_group_t, Ptr{gaspi_rank_t}), group, group_ranks)
end

const gaspi_segment_id_t = Cushort

@enum gaspi_alloc_t::UInt32 begin
    GASPI_MEM_UNINITIALIZED = 0
    # GASPI_ALLOC_DEFAULT = 0
end

"""
    gaspi_segment_alloc(segment_id, size, alloc_policy)

### Prototype
```c
gaspi_return_t gaspi_segment_alloc ( gaspi_segment_id_t const segment_id , gaspi_size_t const size , gaspi_alloc_t const alloc_policy );
```
"""
function gaspi_segment_alloc(segment_id, size, alloc_policy)
    ccall((:gaspi_segment_alloc, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_size_t, gaspi_alloc_t), segment_id, size, alloc_policy)
end

"""
    gaspi_segment_register(segment_id, rank, timeout)

### Prototype
```c
gaspi_return_t gaspi_segment_register ( gaspi_segment_id_t const segment_id , gaspi_rank_t const rank , gaspi_timeout_t const timeout );
```
"""
function gaspi_segment_register(segment_id, rank, timeout)
    ccall((:gaspi_segment_register, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_rank_t, gaspi_timeout_t), segment_id, rank, timeout)
end

"""
    gaspi_segment_create(segment_id, size, group, timeout, alloc_policy)

### Prototype
```c
gaspi_return_t gaspi_segment_create ( gaspi_segment_id_t const segment_id , gaspi_size_t const size , gaspi_group_t const group , gaspi_timeout_t const timeout , gaspi_alloc_t const alloc_policy );
```
"""
function gaspi_segment_create(segment_id, size, group, timeout, alloc_policy)
    ccall((:gaspi_segment_create, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_size_t, gaspi_group_t, gaspi_timeout_t, gaspi_alloc_t), segment_id, size, group, timeout, alloc_policy)
end

const gaspi_pointer_t = Ptr{Cvoid}

const gaspi_memory_description_t = Ptr{Cvoid}

"""
    gaspi_segment_bind(segment_id, pointer, size, memory_description)

### Prototype
```c
gaspi_return_t gaspi_segment_bind ( gaspi_segment_id_t const segment_id , gaspi_pointer_t const pointer , gaspi_size_t const size , gaspi_memory_description_t const memory_description );
```
"""
function gaspi_segment_bind(segment_id, pointer, size, memory_description)
    ccall((:gaspi_segment_bind, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_pointer_t, gaspi_size_t, gaspi_memory_description_t), segment_id, pointer, size, memory_description)
end

"""
    gaspi_segment_use(segment_id, pointer, size, group, timeout, memory_description)

### Prototype
```c
gaspi_return_t gaspi_segment_use ( gaspi_segment_id_t const segment_id , gaspi_pointer_t const pointer , gaspi_size_t const size , gaspi_group_t const group , gaspi_timeout_t const timeout , gaspi_memory_description_t const memory_description );
```
"""
function gaspi_segment_use(segment_id, pointer, size, group, timeout, memory_description)
    ccall((:gaspi_segment_use, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_pointer_t, gaspi_size_t, gaspi_group_t, gaspi_timeout_t, gaspi_memory_description_t), segment_id, pointer, size, group, timeout, memory_description)
end

"""
    gaspi_segment_delete(segment_id)

### Prototype
```c
gaspi_return_t gaspi_segment_delete ( gaspi_segment_id_t const segment_id );
```
"""
function gaspi_segment_delete(segment_id)
    ccall((:gaspi_segment_delete, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t,), segment_id)
end

"""
    gaspi_segment_num(segment_num)

### Prototype
```c
gaspi_return_t gaspi_segment_num ( gaspi_number_t *segment_num );
```
"""
function gaspi_segment_num(segment_num)
    ccall((:gaspi_segment_num, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), segment_num)
end

"""
    gaspi_segment_list(num, segment_id_list)

### Prototype
```c
gaspi_return_t gaspi_segment_list ( gaspi_number_t const num , gaspi_segment_id_t *segment_id_list );
```
"""
function gaspi_segment_list(num, segment_id_list)
    ccall((:gaspi_segment_list, get_gaspi_library()), gaspi_return_t, (gaspi_number_t, Ptr{gaspi_segment_id_t}), num, segment_id_list)
end

"""
    gaspi_segment_ptr(segment_id, pointer)

### Prototype
```c
gaspi_return_t gaspi_segment_ptr ( gaspi_segment_id_t const segment_id , gaspi_pointer_t *pointer );
```
"""
function gaspi_segment_ptr(segment_id, pointer)
    ccall((:gaspi_segment_ptr, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, Ptr{gaspi_pointer_t}), segment_id, pointer)
end

const gaspi_offset_t = Culong

const gaspi_queue_id_t = Cushort

"""
    gaspi_write(segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_write ( gaspi_segment_id_t const segment_id_local , gaspi_offset_t const offset_local , gaspi_rank_t const rank , gaspi_segment_id_t const segment_id_remote , gaspi_offset_t const offset_remote , gaspi_size_t const size , gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_write(segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)
    ccall((:gaspi_write, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_offset_t, gaspi_rank_t, gaspi_segment_id_t, gaspi_offset_t, gaspi_size_t, gaspi_queue_id_t, gaspi_timeout_t), segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)
end

"""
    gaspi_read(segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_read ( gaspi_segment_id_t const segment_id_local , gaspi_offset_t const offset_local , gaspi_rank_t const rank , gaspi_segment_id_t const segment_id_remote , gaspi_offset_t const offset_remote , gaspi_size_t const size , gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_read(segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)
    ccall((:gaspi_read, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_offset_t, gaspi_rank_t, gaspi_segment_id_t, gaspi_offset_t, gaspi_size_t, gaspi_queue_id_t, gaspi_timeout_t), segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)
end

"""
    gaspi_wait(queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_wait ( gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_wait(queue, timeout)
    ccall((:gaspi_wait, get_gaspi_library()), gaspi_return_t, (gaspi_queue_id_t, gaspi_timeout_t), queue, timeout)
end

const gaspi_notification_id_t = Cushort

const gaspi_notification_t = Cuint

"""
    gaspi_notify(segment_id, rank, notification_id, notification_value, queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_notify ( gaspi_segment_id_t const segment_id , gaspi_rank_t const rank , gaspi_notification_id_t const notification_id , gaspi_notification_t const notification_value , gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_notify(segment_id, rank, notification_id, notification_value, queue, timeout)
    ccall((:gaspi_notify, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_rank_t, gaspi_notification_id_t, gaspi_notification_t, gaspi_queue_id_t, gaspi_timeout_t), segment_id, rank, notification_id, notification_value, queue, timeout)
end

"""
    gaspi_notify_waitsome(segment_id, notific_begin, notification_num, first_id, timeout)

### Prototype
```c
gaspi_return_t gaspi_notify_waitsome ( gaspi_segment_id_t const segment_id , gaspi_notification_id_t notific_begin , gaspi_number_t const notification_num , gaspi_notification_id_t *first_id , gaspi_timeout_t const timeout );
```
"""
function gaspi_notify_waitsome(segment_id, notific_begin, notification_num, first_id, timeout)
    ccall((:gaspi_notify_waitsome, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_notification_id_t, gaspi_number_t, Ptr{gaspi_notification_id_t}, gaspi_timeout_t), segment_id, notific_begin, notification_num, first_id, timeout)
end

"""
    gaspi_notify_reset(segment_id, notification_id, old_notification_val)

### Prototype
```c
gaspi_return_t gaspi_notify_reset ( gaspi_segment_id_t const segment_id , gaspi_notification_id_t const notification_id , gaspi_notification_t *old_notification_val);
```
"""
function gaspi_notify_reset(segment_id, notification_id, old_notification_val)
    ccall((:gaspi_notify_reset, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_notification_id_t, Ptr{gaspi_notification_t}), segment_id, notification_id, old_notification_val)
end

"""
    gaspi_write_notify(segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, notification_id, notification_value, queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_write_notify ( gaspi_segment_id_t const segment_id_local , gaspi_offset_t const offset_local , gaspi_rank_t const rank , gaspi_segment_id_t const segment_id_remote , gaspi_offset_t const offset_remote , gaspi_size_t const size , gaspi_notification_id_t const notification_id , gaspi_notification_t const notification_value , gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_write_notify(segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, notification_id, notification_value, queue, timeout)
    ccall((:gaspi_write_notify, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_offset_t, gaspi_rank_t, gaspi_segment_id_t, gaspi_offset_t, gaspi_size_t, gaspi_notification_id_t, gaspi_notification_t, gaspi_queue_id_t, gaspi_timeout_t), segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, notification_id, notification_value, queue, timeout)
end

"""
    gaspi_write_list(num, segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_write_list ( gaspi_number_t const num , gaspi_segment_id_t const *segment_id_local , gaspi_offset_t const *offset_local , gaspi_rank_t const rank , gaspi_segment_id_t const *segment_id_remote , gaspi_offset_t const *offset_remote , gaspi_size_t const *size , gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_write_list(num, segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)
    ccall((:gaspi_write_list, get_gaspi_library()), gaspi_return_t, (gaspi_number_t, Ptr{gaspi_segment_id_t}, Ptr{gaspi_offset_t}, gaspi_rank_t, Ptr{gaspi_segment_id_t}, Ptr{gaspi_offset_t}, Ptr{gaspi_size_t}, gaspi_queue_id_t, gaspi_timeout_t), num, segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)
end

"""
    gaspi_write_list_notify(num, segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, notification_id, notification_value, queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_write_list_notify ( gaspi_number_t const num , gaspi_segment_id_t const *segment_id_local , gaspi_offset_t const *offset_local , gaspi_rank_t const rank , gaspi_segment_id_t const *segment_id_remote , gaspi_offset_t const *offset_remote , gaspi_size_t const *size , gaspi_notification_id_t const notification_id , gaspi_notification_t const notification_value , gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_write_list_notify(num, segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, notification_id, notification_value, queue, timeout)
    ccall((:gaspi_write_list_notify, get_gaspi_library()), gaspi_return_t, (gaspi_number_t, Ptr{gaspi_segment_id_t}, Ptr{gaspi_offset_t}, gaspi_rank_t, Ptr{gaspi_segment_id_t}, Ptr{gaspi_offset_t}, Ptr{gaspi_size_t}, gaspi_notification_id_t, gaspi_notification_t, gaspi_queue_id_t, gaspi_timeout_t), num, segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, notification_id, notification_value, queue, timeout)
end

"""
    gaspi_read_notify(segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, notification_id, queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_read_notify ( gaspi_segment_id_t const segment_id_local , gaspi_offset_t const offset_local , gaspi_rank_t const rank , gaspi_segment_id_t const segment_id_remote , gaspi_offset_t const offset_remote , gaspi_size_t const size , gaspi_notification_id_t const notification_id , gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_read_notify(segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, notification_id, queue, timeout)
    ccall((:gaspi_read_notify, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_offset_t, gaspi_rank_t, gaspi_segment_id_t, gaspi_offset_t, gaspi_size_t, gaspi_notification_id_t, gaspi_queue_id_t, gaspi_timeout_t), segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, notification_id, queue, timeout)
end

"""
    gaspi_read_list(num, segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_read_list ( gaspi_number_t const num , gaspi_segment_id_t const *segment_id_local , gaspi_offset_t const *offset_local , gaspi_rank_t const rank , gaspi_segment_id_t const *segment_id_remote , gaspi_offset_t const *offset_remote , gaspi_size_t const *size , gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_read_list(num, segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)
    ccall((:gaspi_read_list, get_gaspi_library()), gaspi_return_t, (gaspi_number_t, Ptr{gaspi_segment_id_t}, Ptr{gaspi_offset_t}, gaspi_rank_t, Ptr{gaspi_segment_id_t}, Ptr{gaspi_offset_t}, Ptr{gaspi_size_t}, gaspi_queue_id_t, gaspi_timeout_t), num, segment_id_local, offset_local, rank, segment_id_remote, offset_remote, size, queue, timeout)
end

"""
    gaspi_queue_create(queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_queue_create ( gaspi_queue_id_t *queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_queue_create(queue, timeout)
    ccall((:gaspi_queue_create, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_queue_id_t}, gaspi_timeout_t), queue, timeout)
end

"""
    gaspi_queue_delete(queue)

### Prototype
```c
gaspi_return_t gaspi_queue_delete ( gaspi_queue_id_t const queue );
```
"""
function gaspi_queue_delete(queue)
    ccall((:gaspi_queue_delete, get_gaspi_library()), gaspi_return_t, (gaspi_queue_id_t,), queue)
end

"""
    gaspi_queue_size(queue, queue_size)

### Prototype
```c
gaspi_return_t gaspi_queue_size ( gaspi_queue_id_t const queue , gaspi_number_t *queue_size );
```
"""
function gaspi_queue_size(queue, queue_size)
    ccall((:gaspi_queue_size, get_gaspi_library()), gaspi_return_t, (gaspi_queue_id_t, Ptr{gaspi_number_t}), queue, queue_size)
end

"""
    gaspi_queue_purge(queue, timeout)

### Prototype
```c
gaspi_return_t gaspi_queue_purge ( gaspi_queue_id_t const queue , gaspi_timeout_t const timeout );
```
"""
function gaspi_queue_purge(queue, timeout)
    ccall((:gaspi_queue_purge, get_gaspi_library()), gaspi_return_t, (gaspi_queue_id_t, gaspi_timeout_t), queue, timeout)
end

"""
    gaspi_passive_send(segment_id_local, offset_local, rank, size, timeout)

### Prototype
```c
gaspi_return_t gaspi_passive_send ( gaspi_segment_id_t const segment_id_local , gaspi_offset_t const offset_local , gaspi_rank_t const rank , gaspi_size_t const size , gaspi_timeout_t const timeout );
```
"""
function gaspi_passive_send(segment_id_local, offset_local, rank, size, timeout)
    ccall((:gaspi_passive_send, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_offset_t, gaspi_rank_t, gaspi_size_t, gaspi_timeout_t), segment_id_local, offset_local, rank, size, timeout)
end

"""
    gaspi_passive_receive(segment_id_local, offset_local, rank, size, timeout)

### Prototype
```c
gaspi_return_t gaspi_passive_receive ( gaspi_segment_id_t const segment_id_local , gaspi_offset_t const offset_local , gaspi_rank_t *rank , gaspi_size_t const size , gaspi_timeout_t const timeout );
```
"""
function gaspi_passive_receive(segment_id_local, offset_local, rank, size, timeout)
    ccall((:gaspi_passive_receive, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_offset_t, Ptr{gaspi_rank_t}, gaspi_size_t, gaspi_timeout_t), segment_id_local, offset_local, rank, size, timeout)
end

"""
    gaspi_passive_queue_purge(timeout)

### Prototype
```c
gaspi_return_t gaspi_passive_queue_purge (gaspi_timeout_t const timeout);
```
"""
function gaspi_passive_queue_purge(timeout)
    ccall((:gaspi_passive_queue_purge, get_gaspi_library()), gaspi_return_t, (gaspi_timeout_t,), timeout)
end

const gaspi_atomic_value_t = Culong

"""
    gaspi_atomic_fetch_add(segment_id, offset, rank, value_add, value_old, timeout)

### Prototype
```c
gaspi_return_t gaspi_atomic_fetch_add ( gaspi_segment_id_t const segment_id , gaspi_offset_t const offset , gaspi_rank_t const rank , gaspi_atomic_value_t const value_add , gaspi_atomic_value_t *value_old , gaspi_timeout_t const timeout );
```
"""
function gaspi_atomic_fetch_add(segment_id, offset, rank, value_add, value_old, timeout)
    ccall((:gaspi_atomic_fetch_add, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_offset_t, gaspi_rank_t, gaspi_atomic_value_t, Ptr{gaspi_atomic_value_t}, gaspi_timeout_t), segment_id, offset, rank, value_add, value_old, timeout)
end

"""
    gaspi_atomic_compare_swap(segment_id, offset, rank, comparator, value_new, value_old, timeout)

### Prototype
```c
gaspi_return_t gaspi_atomic_compare_swap ( gaspi_segment_id_t const segment_id , gaspi_offset_t const offset , gaspi_rank_t const rank , gaspi_atomic_value_t const comparator , gaspi_atomic_value_t const value_new , gaspi_atomic_value_t *value_old , gaspi_timeout_t const timeout );
```
"""
function gaspi_atomic_compare_swap(segment_id, offset, rank, comparator, value_new, value_old, timeout)
    ccall((:gaspi_atomic_compare_swap, get_gaspi_library()), gaspi_return_t, (gaspi_segment_id_t, gaspi_offset_t, gaspi_rank_t, gaspi_atomic_value_t, gaspi_atomic_value_t, Ptr{gaspi_atomic_value_t}, gaspi_timeout_t), segment_id, offset, rank, comparator, value_new, value_old, timeout)
end

"""
    gaspi_barrier(group, timeout)

### Prototype
```c
gaspi_return_t gaspi_barrier ( gaspi_group_t const group , gaspi_timeout_t const timeout );
```
"""
function gaspi_barrier(group, timeout)
    ccall((:gaspi_barrier, get_gaspi_library()), gaspi_return_t, (gaspi_group_t, gaspi_timeout_t), group, timeout)
end

const gaspi_const_pointer_t = Ptr{Cvoid}

"""
    gaspi_allreduce(buffer_send, buffer_receive, num, operation, datatype, group, timeout)

### Prototype
```c
gaspi_return_t gaspi_allreduce ( gaspi_const_pointer_t const buffer_send , gaspi_pointer_t const buffer_receive , gaspi_number_t const num , gaspi_operation_t const operation , gaspi_datatype_t const datatype , gaspi_group_t const group , gaspi_timeout_t const timeout );
```
"""
function gaspi_allreduce(buffer_send, buffer_receive, num, operation, datatype, group, timeout)
    ccall((:gaspi_allreduce, get_gaspi_library()), gaspi_return_t, (gaspi_const_pointer_t, gaspi_pointer_t, gaspi_number_t, gaspi_operation_t, gaspi_datatype_t, gaspi_group_t, gaspi_timeout_t), buffer_send, buffer_receive, num, operation, datatype, group, timeout)
end

const gaspi_reduce_operation_t = Ptr{Cvoid}

const gaspi_reduce_state_t = Ptr{Cvoid}

"""
    gaspi_allreduce_user(buffer_send, buffer_receive, num, size_element, reduce_operation, reduce_state, group, timeout)

### Prototype
```c
gaspi_return_t gaspi_allreduce_user ( gaspi_const_pointer_t const buffer_send , gaspi_pointer_t const buffer_receive , gaspi_number_t const num , gaspi_size_t const size_element , gaspi_reduce_operation_t const reduce_operation , gaspi_reduce_state_t reduce_state , gaspi_group_t const group , gaspi_timeout_t const timeout );
```
"""
function gaspi_allreduce_user(buffer_send, buffer_receive, num, size_element, reduce_operation, reduce_state, group, timeout)
    ccall((:gaspi_allreduce_user, get_gaspi_library()), gaspi_return_t, (gaspi_const_pointer_t, gaspi_pointer_t, gaspi_number_t, gaspi_size_t, gaspi_reduce_operation_t, gaspi_reduce_state_t, gaspi_group_t, gaspi_timeout_t), buffer_send, buffer_receive, num, size_element, reduce_operation, reduce_state, group, timeout)
end

"""
    gaspi_reduce_operation(operand_one, operand_two, result, state, timeout)

### Prototype
```c
gaspi_return_t gaspi_reduce_operation ( gaspi_const_pointer_t const operand_one , gaspi_const_pointer_t const operand_two , gaspi_pointer_t const result , gaspi_reduce_state_t const state , gaspi_timeout_t const timeout );
```
"""
function gaspi_reduce_operation(operand_one, operand_two, result, state, timeout)
    ccall((:gaspi_reduce_operation, get_gaspi_library()), gaspi_return_t, (gaspi_const_pointer_t, gaspi_const_pointer_t, gaspi_pointer_t, gaspi_reduce_state_t, gaspi_timeout_t), operand_one, operand_two, result, state, timeout)
end

"""
    gaspi_group_max(group_max)

### Prototype
```c
gaspi_return_t gaspi_group_max (gaspi_number_t *group_max);
```
"""
function gaspi_group_max(group_max)
    ccall((:gaspi_group_max, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), group_max)
end

"""
    gaspi_segment_max(segment_max)

### Prototype
```c
gaspi_return_t gaspi_segment_max (gaspi_number_t *segment_max);
```
"""
function gaspi_segment_max(segment_max)
    ccall((:gaspi_segment_max, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), segment_max)
end

"""
    gaspi_queue_num(queue_num)

### Prototype
```c
gaspi_return_t gaspi_queue_num (gaspi_number_t *queue_num);
```
"""
function gaspi_queue_num(queue_num)
    ccall((:gaspi_queue_num, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), queue_num)
end

"""
    gaspi_queue_size_max(queue_size_max)

### Prototype
```c
gaspi_return_t gaspi_queue_size_max ( gaspi_number_t* queue_size_max );
```
"""
function gaspi_queue_size_max(queue_size_max)
    ccall((:gaspi_queue_size_max, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), queue_size_max)
end

"""
    gaspi_queue_max(queue_max)

### Prototype
```c
gaspi_return_t gaspi_queue_max ( gaspi_number_t *queue_max );
```
"""
function gaspi_queue_max(queue_max)
    ccall((:gaspi_queue_max, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), queue_max)
end

"""
    gaspi_transfer_size_max(transfer_size_max)

### Prototype
```c
gaspi_return_t gaspi_transfer_size_max (gaspi_size_t *transfer_size_max);
```
"""
function gaspi_transfer_size_max(transfer_size_max)
    ccall((:gaspi_transfer_size_max, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_size_t},), transfer_size_max)
end

"""
    gaspi_notification_num(notification_num)

### Prototype
```c
gaspi_return_t gaspi_notification_num (gaspi_number_t *notification_num);
```
"""
function gaspi_notification_num(notification_num)
    ccall((:gaspi_notification_num, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), notification_num)
end

"""
    gaspi_passive_transfer_size_max(transfer_size_max)

### Prototype
```c
gaspi_return_t gaspi_passive_transfer_size_max (gaspi_size_t *transfer_size_max);
```
"""
function gaspi_passive_transfer_size_max(transfer_size_max)
    ccall((:gaspi_passive_transfer_size_max, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_size_t},), transfer_size_max)
end

"""
    gaspi_atomic_max(max_value)

### Prototype
```c
gaspi_return_t gaspi_atomic_max (gaspi_atomic_value_t *max_value);
```
"""
function gaspi_atomic_max(max_value)
    ccall((:gaspi_atomic_max, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_atomic_value_t},), max_value)
end

"""
    gaspi_allreduce_buf_size(buf_size)

### Prototype
```c
gaspi_return_t gaspi_allreduce_buf_size (gaspi_size_t *buf_size);
```
"""
function gaspi_allreduce_buf_size(buf_size)
    ccall((:gaspi_allreduce_buf_size, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_size_t},), buf_size)
end

"""
    gaspi_allreduce_elem_max(elem_max)

### Prototype
```c
gaspi_return_t gaspi_allreduce_elem_max (gaspi_number_t *elem_max);
```
"""
function gaspi_allreduce_elem_max(elem_max)
    ccall((:gaspi_allreduce_elem_max, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), elem_max)
end

"""
    gaspi_network_type(network_type)

### Prototype
```c
gaspi_return_t gaspi_network_type (gaspi_network_t *network_type);
```
"""
function gaspi_network_type(network_type)
    ccall((:gaspi_network_type, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_network_t},), network_type)
end

"""
    gaspi_build_infrastructure(build_infrastructure)

### Prototype
```c
gaspi_return_t gaspi_build_infrastructure (gaspi_number_t *build_infrastructure);
```
"""
function gaspi_build_infrastructure(build_infrastructure)
    ccall((:gaspi_build_infrastructure, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), build_infrastructure)
end

"""
    gaspi_version(version)

### Prototype
```c
gaspi_return_t gaspi_version (float *version);
```
"""
function gaspi_version(version)
    ccall((:gaspi_version, get_gaspi_library()), gaspi_return_t, (Ptr{Cfloat},), version)
end

const gaspi_time_t = Cfloat

"""
    gaspi_time_get(wtime)

### Prototype
```c
gaspi_return_t gaspi_time_get (gaspi_time_t *wtime);
```
"""
function gaspi_time_get(wtime)
    ccall((:gaspi_time_get, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_time_t},), wtime)
end

"""
    gaspi_time_ticks(resolution)

### Prototype
```c
gaspi_return_t gaspi_time_ticks (gaspi_time_t *resolution);
```
"""
function gaspi_time_ticks(resolution)
    ccall((:gaspi_time_ticks, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_time_t},), resolution)
end

const gaspi_string_t = Cstring

"""
    gaspi_print_error(error_code, error_message)

### Prototype
```c
gaspi_return_t gaspi_print_error( gaspi_return_t const error_code , gaspi_string_t *error_message );
```
"""
function gaspi_print_error(error_code, error_message)
    ccall((:gaspi_print_error, get_gaspi_library()), gaspi_return_t, (gaspi_return_t, Ptr{gaspi_string_t}), error_code, error_message)
end

"""
    gaspi_statistic_counter_max(counter_max)

### Prototype
```c
gaspi_return_t gaspi_statistic_counter_max ( gaspi_number_t *counter_max );
```
"""
function gaspi_statistic_counter_max(counter_max)
    ccall((:gaspi_statistic_counter_max, get_gaspi_library()), gaspi_return_t, (Ptr{gaspi_number_t},), counter_max)
end

const gaspi_statistic_counter_t = Cuint

@enum gaspi_statistic_argument_t::UInt32 begin
    GASPI_STATISTIC_ARGUMENT_NONE = 0
    GASPI_STATISTIC_ARGUMENT_RANK = 1
end

"""
    gaspi_statistic_counter_info(counter, argument, counter_name, counter_description, verbosity_level)

### Prototype
```c
gaspi_return_t gaspi_statistic_counter_info ( gaspi_statistic_counter_t const counter , gaspi_statistic_argument_t *argument , gaspi_string_t *counter_name , gaspi_string_t *counter_description , gaspi_number_t *verbosity_level );
```
"""
function gaspi_statistic_counter_info(counter, argument, counter_name, counter_description, verbosity_level)
    ccall((:gaspi_statistic_counter_info, get_gaspi_library()), gaspi_return_t, (gaspi_statistic_counter_t, Ptr{gaspi_statistic_argument_t}, Ptr{gaspi_string_t}, Ptr{gaspi_string_t}, Ptr{gaspi_number_t}), counter, argument, counter_name, counter_description, verbosity_level)
end

"""
    gaspi_statistic_verbosity_level(verbosity_level)

### Prototype
```c
gaspi_return_t gaspi_statistic_verbosity_level ( gaspi_number_t const verbosity_level);
```
"""
function gaspi_statistic_verbosity_level(verbosity_level)
    ccall((:gaspi_statistic_verbosity_level, get_gaspi_library()), gaspi_return_t, (gaspi_number_t,), verbosity_level)
end

"""
    gaspi_statistic_counter_get(counter, argument, value)

### Prototype
```c
gaspi_return_t gaspi_statistic_counter_get ( gaspi_statistic_counter_t const counter , gaspi_statistic_argument_t const argument , gaspi_number_t *value );
```
"""
function gaspi_statistic_counter_get(counter, argument, value)
    ccall((:gaspi_statistic_counter_get, get_gaspi_library()), gaspi_return_t, (gaspi_statistic_counter_t, gaspi_statistic_argument_t, Ptr{gaspi_number_t}), counter, argument, value)
end

"""
    gaspi_statistic_counter_reset(counter)

### Prototype
```c
gaspi_return_t gaspi_statistic_counter_reset (gaspi_statistic_counter_t const counter);
```
"""
function gaspi_statistic_counter_reset(counter)
    ccall((:gaspi_statistic_counter_reset, get_gaspi_library()), gaspi_return_t, (gaspi_statistic_counter_t,), counter)
end

"""
    gaspi_pcontrol(argument)

### Prototype
```c
gaspi_return_t gaspi_pcontrol ( gaspi_pointer_t argument );
```
"""
function gaspi_pcontrol(argument)
    ccall((:gaspi_pcontrol, get_gaspi_library()), gaspi_return_t, (gaspi_pointer_t,), argument)
end

const GASPI_GROUP_ALL = gaspi_rank_t(0)
const GASPI_BLOCK = gaspi_timeout_t(0xffffffffffffffff)
const GASPI_TEST = gaspi_timeout_t(0x0)


# exports
const PREFIXES = ["gaspi_", "GASPI_"]
for name in names(@__MODULE__; all=true), prefix in PREFIXES
    if startswith(string(name), prefix)
        @eval export $name
    end
end

end # module
