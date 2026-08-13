Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080B93769FD
	for <fuse-devel@lists.linux.dev>; Thu, 13 Aug 2026 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786655185; cv=none; b=a3lLTuXCE5N6mq4qYoM5vqQ9jrM/YBozBFpt6REifkHJhHwaoTAnokJGdjkgafqen4Ec0N5Ozdt4XzHcOh2y1zP3iLmNmQSZAmaXCAjJFMFoQlHU4Oh5mwoTHH1a2KI3NRbPyRP0NvzyYZ3N4GDM8IGoyTMZ5tKWk8WeqLIx0LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786655185; c=relaxed/simple;
	bh=R1kj8Nj6/SfTQ0MIiA4WuUcCGWRVK6yGwhrF+vMSRnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9ma+kGmw5ea/r8aeyms+IxaNdJhlCoXHNngo5K+tU62XB+0nAt1q13FOnxeFjXiqFazx0jqgK/9cQi+wUBkZGC3kLfChNC2cVaJbI5YamVceGF+H2Z/5stJM78X+QmP9n2CdKTY6Fhns+7SLsNaFPG+VYdrXXTLZ5p87YMP7ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=QFoPj4YA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gVoAQhcE; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="QFoPj4YA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gVoAQhcE"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id A9ACC1D0026E;
	Thu, 13 Aug 2026 17:06:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 13 Aug 2026 17:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786655181;
	 x=1786741581; bh=fEMClcjw3jXvDePakt4y0yKMguMAaR7MSsVztGIa4IE=; b=
	QFoPj4YASh6ivuAbmzL4WK5iyhVPa/vf6e/DU1aheDR8WlxVg2S4WqisZrA7MhZI
	OlNm8YX6ENLGpAxt02f6QsX5HPGmy6rE+BP+nHc2uKz5Kf8VkgfSBMm2QSb+PPAA
	aZbGSOfKC3IfsbQ4Lojj73MjmBPtbD3TyS43vMHWpThUs4O1azkFtBaB08tx+27o
	yTukzn9k+EbdTLbVmWz/Zsp8BWlZFa0VdcLG3bkLGMkB+CQNQQSHTUzB5Hj6frnu
	NhFZXjsudlNaeA3nLjzpyfSTwxy0hu9XsLmb4q4M4l7daSozrs1WFVgfMZZ/Zsr4
	APJFA8Z2iJJptmkoFVgYzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786655181; x=
	1786741581; bh=fEMClcjw3jXvDePakt4y0yKMguMAaR7MSsVztGIa4IE=; b=g
	VoAQhcEVpYfHuuRPnXHYA3e3AR4F5wTOTPG9wYbwgBhMr7xs3JQMoDp6Uzw67H6v
	QJh04VbVdKCRjUS+HJS5jX6lZanwUrxbFXTYjBaQZeJtB3dVRrKhl3vfip9IRFAe
	E2oJc1aQkq+z5N0PSzQEUt+woxdW1Zf3g1q8ZGAHPYUBOZQaAikhe4f3/V7SXt7Q
	TUxICyFSGXXj9CQL3jQaB6V88ulm83QwRLpa5/ESTAyFbrCBTXT2edxfBhuaSLVk
	UhPT3pphy1Fwzm/04SRtZ/CskIX0NRGdAfUFEgozFfI57aT4+dNQDDs/qY/iSGkM
	bD+7e89WGbx4U3Cd1exNQ==
X-ME-Sender: <xms:zDF-apJB0AOmhPjL8e6x-AFQ_vT0fWNQqjh5xQvS-h-cGLnBPsg2Dg>
    <xme:zDF-al2F3FcYSlIO861-Cj3es3kclZ9o9beo8BYLoo9n1mM_EGQdR4BmaXXc3oeIU
    QU3B4qNH5jRm4iH5AICJ6M9j-Ul4KKk5i9zXu0dFKiQ9vI3qAW7>
X-ME-Received: <xmr:zDF-av4qJ2gif_Q7b5twML7QJYr4GiPYXNOd0sh2f80VRuLLTPXZcA76vYMfh154GE6P5cbk0YntGa5ADLM7xw5J_urfoJZ8qj2Y1iHw4jBqTBsZ6yQceRfT>
X-ME-Proxy-Cause: dmFkZTE1ThVBVn7iLvBxOT/1odEI0+vY58GwHsmWOEI8n0Np2mtbhfyUprmclA9ffWzB5p
    GJ6cFmum08yYVjnxHtbYz37TTK4XgnyORHboQtqAgTkdcMy6pIm7MDibX5EfdxHaHYigLF
    7GSu+E50mLWz2tkBzyersbHKB22Hp0mDe0Wm8jQLjFGdfebR8cZd9Ao4URnUk3+cwEkwXU
    ES2aZSt5tVEdfkbHhwzqZC35JDeLjbCqJUPlyKVC53GOrA5ceIHuGAZuLjBwBaKQE3jL0b
    gYMBzFooILFvPX68k0F1US5c6/BuEk6puWnDkYu9mIs4BwDsYklBP5muP0i045Hm5txkqe
    JGqZjeJULVxJBWwIpU1CiLoptsNAOBLnXco5MjpyKNzUkUoIli49XyYl3HCy96UxbbRxPN
    2bCZOqsM8tuQABh3dQniQETxqhqSjIJpr5vzve4YiQdj/Z4/lgfJwXHPgDX2LevNnkR6Dr
    k8ji41R0Vhy8J1feAhEE3ok/PtUtGEwPTHPLXOVP1UsSqnmnaKJoXMT92403rTCffX3aLX
    +NhNH7qXZx1QXHhPZDU7itNNXSFaiEm1zkVG2CqJmP7wwQKoti3wfycVx09Tsvx+JZd0d+
    3JIkw9FZd/hlFKd+guACkf9/Q2tp0GAU/cVweqOvjU2UEiErRhpEFjHdWyqA
X-ME-Proxy: <xmx:zDF-au_hwsGf2-c622ElHYqKu5Lz9iW_kbPWpr1W_YmaBK4y6JI-Cg>
    <xmx:zDF-amVIJZXZOIIoGaztfo0aVLg3NYOXp_gzclR_GDXxDoC7K7ydpA>
    <xmx:zDF-ahqMb-GEMM-w9Mt9jvb1AFXQGqApC4fv-V_JKePPuq_0eTyeUA>
    <xmx:zDF-agnB4ntl1MBNfAnJ2MvSo6JosZaLOhxytHGWqqchPRv03p1hlA>
    <xmx:zTF-ai7quyafUapvwgFzV7IAsUWXOrsbf4xonTjr7fua0gb3OkpnIUZF>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 17:06:18 -0400 (EDT)
Message-ID: <bb69a16c-edf9-4f65-bd64-7c0a56d17e47@bsbernd.com>
Date: Thu, 13 Aug 2026 23:06:16 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] fuse: support registered buffer pools in io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, jlayton@kernel.org, libaokun@linux.alibaba.com,
 axboe@kernel.dk, amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260716175908.2339738-1-joannelkoong@gmail.com>
 <20260716175908.2339738-5-joannelkoong@gmail.com>
 <fa4e1520-b36e-4619-a1b2-5974f27a5cc4@bsbernd.com>
 <CAJnrk1ah0+F+VvpGnLJwqmKFRfb1Bo8Vc_V6ucy5=9JQT=G9Wg@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1ah0+F+VvpGnLJwqmKFRfb1Bo8Vc_V6ucy5=9JQT=G9Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/13/26 00:56, Joanne Koong wrote:
> On Tue, Aug 11, 2026 at 3:45 PM Bernd Schubert <bernd@bsbernd.com> wrote:
>>
>>
>>
>> On 7/16/26 19:59, Joanne Koong wrote:
>>> Allow servers to use a buffer pool that is also registered through
>>> io-uring. When the server registers a buffer pool with io-uring, the
>>> pages backing the pool are pinned upfront. This eliminates the overhead
>>> of pinning/unpinning user pages and translating virtual addresses per
>>> i/o request. This also allows servers to use the same registered memory
>>> for subsequent backing store I/O (eg read_fixed/write_fixed), keeping
>>> data in the same pinned pages without additional pinning or mapping
>>> overhead required.
>>>
>>> To use this, the server needs to set the FUSE_URING_REGISTERED_BUFPOOL
>>> flag when adding a bufpool through the FUSE_IO_URING_CMD_ADD_BUFPOOL
>>> cmd. For every sqe submitted (including the one for adding the bufpool),
>>> it should set sqe->uring_cmd_flags to include IORING_URING_CMD_FIXED,
>>> and pass in the index where the registered bufpool resides to
>>> sqe->buf_index.
>>>
>>> Benchmarked with passthrough_hp (--nopassthrough, q_depth=8) on a
>>> 2-socket Intel Xeon Gold 6138 (40 cores / 80 threads), using fio (sync
>>> engine, bs=1M, O_DIRECT, numjobs=2, 30s run + 10s ramp, 3 runs) where
>>> direct-I/O throughput is against a RAM-backed (tmpfs) source (backing
>>> I/O is not the bottleneck):
>>>
>>>                   baseline      registered buffers
>>>   direct read       ~5.1 GB/s     ~5.4 GB/s   (+~5%)
>>>   direct write      ~3.4 GB/s     ~4.8 GB/s   (+~45%)
>>>
>>> Registered buffers bring up the write path speed up closer to speed of
>>> reads. There isn't much improvement for reads because it is already fast
>>> enough where it's at the copy-bound ceiling (surpassing that requires
>>> doing zero-copy). On a device-bound NVMe though, the differences are
>>> within noise, as backing I/O dominates per-request latency.
>>>
>>> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
>>> ---
>>>  fs/fuse/dev_uring.c       | 122 +++++++++++++++++++++++++++++++-------
>>>  fs/fuse/dev_uring_i.h     |   8 +++
>>>  include/uapi/linux/fuse.h |   4 ++
>>>  3 files changed, 112 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
>>> index e9da92b46090..ed7e783bd68d 100644
>>> --- a/fs/fuse/dev_uring.c
>>> +++ b/fs/fuse/dev_uring.c
>>> @@ -22,6 +22,8 @@ MODULE_PARM_DESC(enable_uring,
>>>  #define FUSE_URING_IOV_HEADERS 0
>>>  #define FUSE_URING_IOV_PAYLOAD 1
>>>
>>> +#define FUSE_URING_ADD_BUFPOOL_FLAGS (FUSE_URING_REGISTERED_BUFPOOL)
>>> +
>>>  bool fuse_uring_enabled(void)
>>>  {
>>>       return enable_uring;
>>> @@ -47,6 +49,27 @@ static inline bool bufpool_enabled(struct fuse_ring_queue *queue)
>>>       return queue->payload_mode == FUSE_PAYLOAD_BUFPOOL;
>>>  }
>>>
>>> +static inline bool bufpool_registered(struct fuse_ring_queue *queue)
>>> +{
>>> +     return queue->bufpool && queue->bufpool->registered;
>>> +}
>>> +
>>> +/*
>>> + * For a registered bufpool, every sqe that drives a payload import (REGISTER,
>>> + * COMMIT_AND_FETCH) must carry the registered buffer index of the pool.
>>> + * This also must be called from the command's issue handler, where cmd->sqe is
>>> + * still valid
>>> + */
>>> +static inline bool fuse_uring_cmd_index_ok(struct io_uring_cmd *cmd,
>>> +                                        struct fuse_ring_queue *queue)
>>> +{
>>> +     if (!bufpool_registered(queue))
>>> +             return true;
>>> +
>>> +     return (cmd->flags & IORING_URING_CMD_FIXED) &&
>>> +            READ_ONCE(cmd->sqe->buf_index) == queue->bufpool->registered_index;
>>> +}
>>> +
>>>  static void uring_cmd_set_ring_ent(struct io_uring_cmd *cmd,
>>>                                  struct fuse_ring_ent *ring_ent)
>>>  {
>>> @@ -653,19 +676,42 @@ static int copy_header_from_ring(struct fuse_ring_ent *ent,
>>>       return 0;
>>>  }
>>>
>>> +static int fuse_uring_import_payload(struct fuse_ring_ent *ent, int dir,
>>> +                                  struct iov_iter *iter,
>>> +                                  unsigned int issue_flags)
>>> +{
>>> +     void __user *base = ent->payload.iov_base;
>>> +     size_t len = ent->payload.iov_len;
>>> +     int err = 0;
>>> +
>>> +     if (!base) {
>>> +             memset(iter, 0, sizeof(*iter));
>>> +             return 0;
>>> +     }
>>> +
>>> +     if (bufpool_registered(ent->queue))
>>> +             err = io_uring_cmd_import_fixed((u64)(uintptr_t)base, len, dir,
>>> +                                             iter, ent->cmd, issue_flags);
>>> +     else
>>> +             err = import_ubuf(dir, base, len, iter);
>>
>> Hmm ok, just an annotation, I have to admit that I don't like
>> issue_flags too much. Especially for the optimization that DDN has by
>> avoiding io_uring_cmd_complete_in_task(), IO_URING_F_UNLOCKED is rather
>> painful. Additionaly with that optimization the lock might get
>> contended. The new addition here doesn't introduce it, but also doesn't
>> make it any better.
> 
> For what it's worth, the locks aren't taken on these paths (eg sends
> go through fuse_uring_dispatch_ent() ->
> io_uring_cmd_complete_in_task() and task work runs with
> ctx->uring_lock held, and commits run in the command's issue handler,
> where the lock is likewise held).

Yeah, except for the optimization that avoids
io_uring_cmd_complete_in_task/fuse_uring_send_in_task
and submits the request directly from the caller.
Anyway, it was just an annotation, as this lock is not new.

> 
> Threading the issue_flags through gets a bit annoying, but I
> personally don't see a better way for core io-uring infrastructure to
> determine whether a given call path already holds the lock or not.
> 

The flag doesn't work that well with the optimization when the caller is
in io-uring context, we need to figure out that with Jens/Pavel later on.

>>
>>> +
>>> +     if (err)
>>> +             pr_info_ratelimited("fuse: Import of user buffer failed\n");
>>> +
>>> +     return err;
>>> +}
>>> +
>>> @@ -1362,8 +1421,21 @@ static int fuse_uring_add_bufpool(struct io_uring_cmd *cmd,
>>>       uintptr_t pool_uaddr;
>>>       unsigned int pool_len, nr_bufs;
>>>       size_t pool_size, buf_size;
>>> +     bool registered = flags & FUSE_URING_REGISTERED_BUFPOOL;
>>> +
>>> +     if (!ring || qid >= ring->nr_queues)
>>> +             return -EINVAL;
>>>
>>> -     if (!ring || qid >= ring->nr_queues || flags)
>>> +     if (flags & ~FUSE_URING_ADD_BUFPOOL_FLAGS)
>>> +             return -EINVAL;
>>> +
>>> +     /*
>>> +      * A registered bufpool is reached through an io_uring fixed buffer, so
>>> +      * this command must be submitted with IORING_URING_CMD_FIXED and the
>>> +      * registered buffer index in sqe->buf_index. That index is recorded
>>> +      * below and enforced on every REGISTER / COMMIT_AND_FETCH sqe.
>>> +      */
>>> +     if (registered && !(cmd->flags & IORING_URING_CMD_FIXED))
>>>               return -EINVAL;
>>
>> Hmm, why do we actually need FUSE_URING_REGISTERED_BUFPOOL if the
>> decision can be made by IORING_URING_CMD_FIXED?
> 
> It's not strictly needed, but imo it makes uapi more explicit and the
> contract more clear. I don't feel strongly about this though, I'm fine
> with either approach.

I don't have a strong opinion, it just looks a bit weird to have a flag
that could be used and then to introduce another one and give userspace
even more choices and possible failure points.
Would there ever be a reason to register a buffer, but not to use that
in fuse?

> 
>>
>>>
>>> diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
>>> index cdf56f8b38b5..e142cae43022 100644
>>> --- a/fs/fuse/dev_uring_i.h
>>> +++ b/fs/fuse/dev_uring_i.h
>>> @@ -49,6 +49,14 @@ enum fuse_queue_payload_mode {
>>>  };
>>>
>>>  struct fuse_bufpool {
>>> +     bool registered;
>>> +
>>> +     /*
>>> +      * io_uring registered buffer table index for this pool, bound at
>>> +      * ADD_BUFPOOL time. Only valid if the bufpool is registered
>>> +      */
>>> +     u16 registered_index;
>>
>> Dunno, could this go into the previous commit or be reserved in the
>> previous commit? This addition make bisect hard due to ABI change?
> 
> This is an addition to a kernel-internal struct, not an uapi-defined
> one, so I don't think this affects ABI. The previous commit doesn't
> have any notion of registered buffers, so I think moving these
> definitions to the previous commit would be confusing.

Ah yes sorry, my fault, I shouldn't do reviews past midnight. Sorry again.


Thanks,
Bernd
