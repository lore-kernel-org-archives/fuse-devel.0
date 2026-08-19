Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C14634FF41
	for <fuse-devel@lists.linux.dev>; Wed, 19 Aug 2026 20:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169934; cv=none; b=c9+zsH3/5Kjbbfv/XPA6UH/kdvphybo28iMb5lnFHdMNJSy4pWYXKS22uHmdxQr8hN8oiCtvKyLd4lPDJgxkcV45kIIgbkqvGblwVM856OQ8zWBS7tWMyofDUCOLIYy1CzI8KIiNy4GQXelZYSTIowYAbERLZHEjNusrr0rXDUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169934; c=relaxed/simple;
	bh=0yKe1QEedH+uQNEnwQYgsJAdGrZ3Ahyp11HYcg51Ef4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g92IiGcMGUpC6R+shmfILtT7geXL2c3btaorQvBy/diNF9/GLQ9jJ7AlkHYDDj45XmadeDCPefgptEN2jWNFRE9qPe9AZlWaFw/3VB2kPC/IBTu4G+n3u3Vrvm9DxTMZYFAeRKENTteOPXoMSqhOcSKIZa5SW1VlXbTva4/LAs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com; spf=pass smtp.mailfrom=bsbernd.com; dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b=rjWU/2xj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WkH6ByjB; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bsbernd.com header.i=@bsbernd.com header.b="rjWU/2xj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WkH6ByjB"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 6FDDE1D00112;
	Wed, 19 Aug 2026 16:05:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 19 Aug 2026 16:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787169931;
	 x=1787256331; bh=7tLOezc5JlrWq3MTQLBAJya+ktESKcnkXj08zFVbkqI=; b=
	rjWU/2xju9RLoRfTrEPQn/b55f7YIk41tu7NFuzpmTdhkL9xavDUzZGx5yGeHQy1
	NVhjGYo58iB5ZUuPXhCEt48aSgQSjwwEFVBko//MMji1ZyTv0nrBXpWys/BHobS/
	lanJ0OmXtshGY2CvpBzmnDbc797LLcid1rSj+Efb4L2T4OVRtDALDOzNUf2Wd7OG
	X14aihX/hx9cvn32qXfsb8m8tAuqe5W7NLLj629m0Gx7kmJAuzmcsTpOdZFf0VJU
	sRXnZz+FIiAAnF4r8qZuUAjnD03vwuFgQtx1uMh4RLtatVy30gfplPamxfK980kU
	E4fMniKcE9+M+DeIRzZsow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787169931; x=
	1787256331; bh=7tLOezc5JlrWq3MTQLBAJya+ktESKcnkXj08zFVbkqI=; b=W
	kH6ByjBXhvYO0tAAjxhsxE+Qk7gN/T0ZeQ5w25S5iBdt4Eko4m4Zlpyo9C/x5yPo
	f8sibbAq1tVufSvFhQAE6vU2TZUXrsA98Lcd0JWEi/C0R6gOBAqwo6a4+28TbBBF
	AX85NYgkp+zpfcSLxqVsC1BP2FdVjxebgGr5HE2+J1z7mPHBNj8D6B0J/Pl8W2jy
	OAF91APkWRYkD4KvY4S5yuE+joDDGuwrNZZyBvZOvRW6XRuX/gMfob3HL0GWc3CI
	aK5EmQDk+XoJKuIciQgK6jjiyTREILo4rzIZWkYatnhLkTOEymBvLdppE84VMt6E
	ftT+ogEuG5rvOEXn8JOOQ==
X-ME-Sender: <xms:igyGasY-hNbZWj1seixWY4sLQ5vEUaRZ3C2t_D-fn7hZYQ4DTuxwMA>
    <xme:igyGaoEM7EfAIvroWu7mlzSDCe9GHL-3DiNTL2WgmzTeMYoGajsXi7F7KXACnY5i1
    K50C94upjZLr_TFE1zYZQOkG51dsQqBcaZSqeDp0nRsBVeHpneoYg>
X-ME-Received: <xmr:igyGalINXl8o-EpjBq1XBvilh1hdtW-u-wuGZgLhorvm45aoaX-7sqxKXgIafx5n3yW2fthb9ai0Mzin2oO-DKibirrpzD__cXVnF1wmbaVI4vykogv2PwtItg>
X-ME-Proxy-Cause: dmFkZTGBUKO7kjw05PXHlbsd29JjO6ecWWPwahULeifDTjkijs3uwFWiFlE5qkycs/nRzh
    cq5cQC7JKWw9B7dLFbaF0tF3EE2Bx/+m3qWS4v7Oaj1pMycfAULOwpmZpgD1Klx8dNJzb1
    4pJIBliBeFJuYBIaCAR75rtmRIgxUn/BzYgLGfMiKJ0RkxTDfAj2QiQGoFdSDKkn3Z1wuS
    e3g9VPAq1CrGPpz6L8A5w14C9z/JC7jerzRvt/Cm3fvPeJ9CkW5SwL+SYQMF3SKxZBDSLF
    D4XtZMyI1QrLj0yfQpv/I/4d1o+xZXdgoU8Lapy86yn0oZVqrKkMRNeruRqxgJOhAdghpD
    /p/pEvuA8J0pAUbTmXEFcTGrvIRA0Tfzej8K0L2jmkhsobIO/WPYKv7rZ47XclZ/Q+axBd
    1idQOwUTmSPdnrr/LUC0YolNCTg2TwKI1ZUbIqhnY3p1jruWfYp1CQbu0gWbWQRSk8QL2p
    Ge0jApr+uPM4U9nQW6s87gNhdb9Rlt0V7UvBtLQBZBNtkx7uwvq0mNeUtBHopXvdPtbvSr
    3xFAmGu+lGL0OSqg7zUrL0F1CXf4wicdSPS7CGtiMLAL+2OkvkqQRzyotAP08yIOHljgMR
    owZ7DP3RgENNJ1rWhCeWeJcJbi+CIM61FB5a0RQt3oskknS/YQv4P64SvJPQ
X-ME-Proxy: <xmx:igyGarO36NCoZUvyyRsvUEuzt7PYf8_LRsClDtN92q6_o-nCvWHJfA>
    <xmx:igyGatlk_w7NIx1YD9qJG7tFgT-LdrcLQkgBtg-XNWLC6cyZfdAKtg>
    <xmx:igyGan7hzYv21e_mlBMpJB9svz10nZg8dxaWD3ldXiclJ49V5l7nLg>
    <xmx:igyGap309DaoIUMHTS_3ngVYukjZl2lTU4e3qjC6zPO7SkcOuIAg7g>
    <xmx:iwyGajKpf_7nm3OYEoG80nhddJ1yzQ9dHvd6B3kqbNkA18gaMpOv8eZ7>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 16:05:28 -0400 (EDT)
Message-ID: <f0cc2fd8-bf0a-4722-b81c-d54fbafd00a7@bsbernd.com>
Date: Wed, 19 Aug 2026 22:05:26 +0200
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/6] fuse: decouple fuse_ring creation from ent
 registration
To: Joanne Koong <joannelkoong@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: jlayton@kernel.org, libaokun@linux.alibaba.com, axboe@kernel.dk,
 amir73il@gmail.com, fuse-devel@lists.linux.dev
References: <20260814185946.3679478-1-joannelkoong@gmail.com>
 <20260814185946.3679478-2-joannelkoong@gmail.com>
 <CAJfpegt2NTn27A_QoMnfb8gDLZpRc9WHzWW6wGBjWc+nvJxg=A@mail.gmail.com>
 <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <CAJnrk1bocn3zSUe23E4F6oTNyosmF8kdVdFB-2hX2qbSqx-LDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/19/26 19:56, Joanne Koong wrote:
> On Wed, Aug 19, 2026 at 4:35 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
>>
>> On Fri, 14 Aug 2026 at 21:00, Joanne Koong <joannelkoong@gmail.com> wrote:
>>>
>>> Currently, the connection's fuse_ring is created lazily on the first
>>> FUSE_IO_URING_CMD_REGISTER command. A server registers entries from one
>>> thread per queue (one per CPU) and those threads issue their first
>>> REGISTER command concurrently. They then race to create the single
>>> per-connection fuse_ring, which required open-coded handling in
>>> fuse_uring_create() to detect and protect against concurrent creations.
>>>
>>> Decouple fuse_ring creation from ent registration and move it to
>>> FUSE_INIT reply processing after a server has negotiated and set
>>> FUSE_OVER_IO_URING. The ring is published before the connection is
>>> marked initialized. fuse_uring_register() no longer creates the ring and
>>> it instead uses the ring set up at init time.
>>
>> I tested this with loraw (a "raw" loopback tester that doesn't use
>> libfuse) and it fails with
>>
>> root@kvm:~# ./loraw -u  /mnt/fuse
>> loraw: loraw.c:1010: lo_start_uring: Assertion `!cqe->res' failed.
>>
>> cqe->res is -22 (EINVAL).
>>
>> Attaching the reproducer.  To compile:
>>
>> cp $(KERNEL_TREE)/include/uapi/linux/fuse.h fuse_kernel.h
>> gcc loraw.c -oloraw -luring
>>
> 
> Thanks for attaching the repro.
> 
> This is happening because this patch uses the FUSE_OVER_IO_URING init
> reply as a signal that the ring should be created, but I missed that
> the FUSE_OVER_IO_URING reply is *optional*.
> 
> Prior to this patch, there's two scenarios:
> a) server sets FUSE_OVER_IO_URING reply at init time - requests will
> automatically block until fuse-io-uring is completely set up
> b) server does not set FUSE_OVER_IO_URING but later sends uring
> register request - requests will continue along /dev/fuse path until
> fuse-io-uring is completely set up
> 
> Libfuse sets FUSE_OVER_IO_URING in the reply, but the loraw.c server does not.
> 
> I think the best way to fix this is to have the ring creation happen
> when the kernel receives the first io-uring command instead of at
> FUSE_INIT or at FUSE_IO_URING_CMD_REGISTER ent creation time, given
> that FUSE_IO_URING_ADD_QUEUE needs the ring to exist:

I don't think we should allow io-uring without FUSE_OVER_IO_URING and 
I really thought that was disabled. 

<... checking the code ...>

I'm on a ublk branch without your commits a applied, i.e. plain upstream 7.2 fuse

fuse_uring_cmd()
	/* Once a connection has io-uring enabled on it, it can't be disabled */
	if (!enable_uring && !fch->io_uring) {
		pr_info_ratelimited("fuse-io-uring is disabled\n");
		return -EOPNOTSUPP;
	}



In process_init_reply()

if (flags & FUSE_OVER_IO_URING && fuse_uring_enabled())
    fuse_chan_io_uring_enable(fc->chan);


And this is also absolutely needed to block requests in fuse_block_alloc(),
which is a requirement to avoid lock order issues between queue->lock and
fch->bg_lock (at least I believe that has not been solved yet).


I'm going to try Miklos' reproducer in a bit, but one way or the other
let's please not allow io-uring without FUSE_OVER_IO_URING reply.


Thanks,
Bernd


> 
> Subject: [PATCH] fuse: create fuse_ring on the first io-uring command
> 
> Commit 6330b1f61ed1 ("fuse: decouple fuse_ring creation from ent
> registration") moved fuse_ring creation to FUSE_INIT reply processing,
> gated on the server setting FUSE_OVER_IO_URING in its reply flags.
> 
> However, that flag is optional. Libfuse sets it but servers not going
> through libfuse may not.
> 
> Create the ring on the first io-uring command instead, independent of
> what the server negotiated. Ring creation stays decoupled from ent
> registration, which FUSE_IO_URING_CMD_ADD_QUEUE depends on since it
> needs the ring to exist before any entry is registered.
> 
> Fixes: 6330b1f61ed1 ("fuse: decouple fuse_ring creation from ent registration")
> Reported-by: Miklos Szeredi <mszeredi@redhat.com>
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>
> ---
>  fs/fuse/dev.c         |  2 +-
>  fs/fuse/dev_uring.c   | 18 +++++++++++-------
>  fs/fuse/dev_uring_i.h |  5 -----
>  3 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index 4fec31fc0b84..a665d76292c9 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -77,7 +77,7 @@ void fuse_chan_set_initialized(struct fuse_chan
> *fch, struct fuse_chan_param *pa
>                 fch->max_pages = param->max_pages;
> 
>                 if (param->io_uring_enabled)
> -                       fuse_uring_conn_init(fch);
> +                       fch->io_uring = 1;
>         }
> 
>         /* Pairs with smp_load_acquire() readers of fch->initialized */
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index e22a48c9a678..23c26099d159 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -303,6 +303,7 @@ static struct fuse_ring *fuse_uring_create(struct
> fuse_chan *fch)
>  {
>         struct fuse_ring *ring;
>         size_t nr_queues = num_possible_cpus();
> +       struct fuse_ring *res = NULL;
>         size_t max_payload_size;
> 
>         ring = kzalloc_obj(*ring, GFP_KERNEL_ACCOUNT);
> @@ -322,6 +323,12 @@ static struct fuse_ring *fuse_uring_create(struct
> fuse_chan *fch)
>                 spin_unlock(&fch->lock);
>                 goto out_err;
>         }
> +       if (fch->ring) {
> +               /* race, another thread created the ring in the meantime */
> +               spin_unlock(&fch->lock);
> +               res = fch->ring;
> +               goto out_err;
> +       }
> 
>         init_waitqueue_head(&ring->stop_waitq);
> 
> @@ -336,13 +343,7 @@ static struct fuse_ring *fuse_uring_create(struct
> fuse_chan *fch)
>  out_err:
>         kfree(ring->queues);
>         kfree(ring);
> -       return NULL;
> -}
> -
> -void fuse_uring_conn_init(struct fuse_chan *fch)
> -{
> -       if (fuse_uring_create(fch))
> -               fch->io_uring = 1;
> +       return res;
>  }
> 
>  static struct fuse_ring_queue *fuse_uring_create_queue(struct fuse_ring *ring,
> @@ -1685,6 +1686,9 @@ int fuse_uring_cmd(struct io_uring_cmd *cmd,
> unsigned int issue_flags)
>         if (!smp_load_acquire(&fch->initialized))
>                 return -EAGAIN;
> 
> +       if (!smp_load_acquire(&fch->ring) && !fuse_uring_create(fch))
> +               return -ENOMEM;
> +
>         switch (cmd_op) {
>         case FUSE_IO_URING_CMD_REGISTER:
>                 err = fuse_uring_register(cmd, issue_flags, fch);
> diff --git a/fs/fuse/dev_uring_i.h b/fs/fuse/dev_uring_i.h
> index 263d0f8b9714..3233b07430d2 100644
> --- a/fs/fuse/dev_uring_i.h
> +++ b/fs/fuse/dev_uring_i.h
> @@ -184,7 +184,6 @@ struct fuse_ring {
>         bool ready;
>  };
> 
> -void fuse_uring_conn_init(struct fuse_chan *fch);
>  void fuse_uring_stop_queues(struct fuse_ring *ring);
>  void fuse_uring_abort_end_requests(struct fuse_ring *ring);
>  int fuse_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags);
> @@ -224,10 +223,6 @@ static inline bool fuse_uring_ready(struct fuse_chan *fch)
> 
>  #else /* CONFIG_FUSE_IO_URING */
> 
> -static inline void fuse_uring_conn_init(struct fuse_chan *fch)
> -{
> -}
> -
>  static inline void fuse_uring_abort(struct fuse_chan *fch)
>  {
>  }
> --
> 2.52.0
> 
> 
> If you'd prefer an inline replacement for the original commit instead
> of a fixup patch on top of the tree, please let me know and I'd be
> happy to send that over. Whatever would be easiest for you.
> 
> Thanks,
> Joanne

