Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE120371CE0
	for <fuse-devel@lists.linux.dev>; Mon,  8 Jun 2026 12:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920870; cv=none; b=tbp6dJlZwViV8VXg0qhor6M2zMVpgELlwNmYjx+cSp/tjNrMZ4Sw4y4xKdbKfpkq4BnBVSv+L9cOfNwFC1kJHcCJhKh3fKVap8mCR9Q9zT6NLLFOAr1AnhKkGnRNcoRQfZOdMoyOogA6y2yaj8CsC+rUcQrAxXoa3Jc/qf6s58s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920870; c=relaxed/simple;
	bh=U4xsQWopaGucUC265+AjMI6AgRg+AmsXhC1bXpOOS88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZrK9qh9W+dPktXQ+4dHS4WhxCOT22zDmx+B+K3IRAEM6U4dAHjiJ/9q+0+ek04xNIUKBmKjrkIUzvTNK/vM99dp/czY4kvoQwapKpGOY7rj8UMKQh7NdUkHFdRpIXJKTlsEeENJWtYefwshaTt4z2gD0kgoyOtp2VSxvOOq5/iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ilp99BR+; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ilp99BR+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780920862; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=gYxZBvoIe2ah0i2GK1Yt12vUUR/T6mC8LE+nU01+LZY=;
	b=ilp99BR+jrczKdkz2Es8IRp6FOHMTN8De1tRx6P6Gy//UJBqUl8d7G2Zb0E/zZkxscSg9x9jA2WQVPSZIuFGCdG8Bc1KelJg/mIaLFmqhXwu8GpT6KrvDwPyttd5AyZ2ZryhDQGOJN5ajQeB5qneEC/9oNn51wbdeUwvvZYVf6U=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=libaokun@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X4OUO5X_1780920861;
Received: from 30.221.148.53(mailfrom:libaokun@linux.alibaba.com fp:SMTPD_---0X4OUO5X_1780920861 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 08 Jun 2026 20:14:21 +0800
Message-ID: <6ae8fcca-2a48-4555-98cc-930c0dd3589a@linux.alibaba.com>
Date: Mon, 8 Jun 2026 20:14:21 +0800
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] fuse: add zero-copy over io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, bernd@bsbernd.com, jlayton@kernel.org,
 axboe@kernel.dk, fuse-devel@lists.linux.dev
References: <20260522205823.1597313-1-joannelkoong@gmail.com>
 <20260522205823.1597313-10-joannelkoong@gmail.com>
 <d1d588e9-5d4b-4e3f-8154-e769e9e69f12@linux.alibaba.com>
 <CAJnrk1bSr7B3kp3x8RdZWM+6F6H2h7r-pJhvqxoFpxaOtjF2mQ@mail.gmail.com>
 <CAJnrk1Y5AMZYz8cy9RJHFzYTK=H0we0b9uJiCHQz5EcZaMZzqg@mail.gmail.com>
From: Baokun Li <libaokun@linux.alibaba.com>
In-Reply-To: <CAJnrk1Y5AMZYz8cy9RJHFzYTK=H0we0b9uJiCHQz5EcZaMZzqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026/6/5 05:42, Joanne Koong wrote:
>>> Hi Joanne,
>>>
>>> If a connection abort happens while a zero-copy request is in-flight,
>>> io_buffer_unregister() is never called. The buf_table slot remains
>>> occupied and folios stay pinned until the io_uring ring is destroyed.
>>>
>>> So perhaps we need to add the corresponding cleanup in
>>> fuse_uring_entry_teardown(). Otherwise looks good to me:
>>>
>>> Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>
>> Hi Baokun,
>>
>> Thanks for reviewing this series.  That's a good point - the io buffer
>> is unregistered in fuse_uring_req_end() when a request is ended, but
>> the abort code calls fuse_uring_stop_fuse_req_end(), not
>> fuse_uring_req_end(). I'll add this in.
> Revisiting this... I had this cleanup in the series I sent out last
> December [1] but in order to accommodate unregistration on teardown
> during the abort race, it requires nontrivial changes to io-uring, as
> it requires operating on a ring ctx handle but it's tricky to
> ascertain if the handle is valid or not. I had discussed it with Jens
> at LPC last year, and we came to the conclusion that it's not worth
> introducing the complexity to accommodate this specific scenario and
> it's fine to leave the buffer table slot occupied with pinned folios
> until the io-uring ring is destroyed.

Hi Joanne,

Thanks for explaining the background.

I think we can handle this with a simple change in
fuse_uring_entry_teardown(), without any io-uring side modifications:

--- a/fs/fuse/dev_uring.c
+++ b/fs/fuse/dev_uring.c
@@ -514,8 +514,14 @@ static void fuse_uring_entry_teardown(struct
fuse_ring_ent *ent)
        ent->state = FRRS_RELEASED;
        spin_unlock(&queue->lock);

-       if (cmd)
+       if (cmd) {
+               if (ent->zero_copied) {
+                       io_buffer_unregister(cmd, ent->zero_copy_index,
+                                            IO_URING_F_UNLOCKED);
+                       ent->zero_copied = false;
+               }
                io_uring_cmd_done(cmd, -ENOTCONN, IO_URING_F_UNLOCKED);
+       }

        if (req)
                fuse_uring_stop_fuse_req_end(req);

Here's why I believe this is safe:

1) No race with IO_URING_F_CANCEL. The cancel path
   (fuse_uring_cancel) only takes cmd from entries in
   FRRS_AVAILABLE state:

     spin_lock(&queue->lock);
     if (ent->state == FRRS_AVAILABLE) {
         ent->cmd = NULL;
         ...
     }
     spin_unlock(&queue->lock);

   When zero_copied == true, the entry is processing a request and
   is NOT in FRRS_AVAILABLE state. So cancel will never steal cmd
   from a zero-copied entry. Teardown is guaranteed to find
   cmd != NULL under queue->lock for this case.

2) Ring ctx is guaranteed alive. Since io_uring_cmd_done() has not
   been called yet, the io_kiocb is still inflight and holds a
   reference to the ring ctx. io_buffer_unregister() can safely
   operate on it.

3) The scenario motivating this fix: a multi-mount fuse daemon
   (e.g., virtiofsd serving multiple VMs) gets "umount -f" on one
   mount. The connection aborts but the daemon and its io_uring
   ring stay alive indefinitely. Without this cleanup, the pinned
   folios from the aborted mount remain in the buffer table slots
   until the daemon process eventually exits — freed only through:

     close(ring_fd) / process exit
       → io_ring_ctx_free
         → io_sqe_buffers_unregister
           → io_rsrc_data_free
             → io_put_rsrc_node
               → io_free_rsrc_node
                 → io_buffer_unmap
                   → imu->release(imu->priv)

   For a long-lived daemon, this could be days or weeks.


Thanks,
Baokun


