Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05263DC4C2
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517940; cv=pass; b=OJQaRfpdxkQ5YyAKVOGTB0lSACPJqz++kiLNf9B8U8+RXCls2+loZZ4YajZzeaPjLtWIx+OxijCteTeNBUcUPomuXtZbaIIQcZAtsayeO0je6alM+BrUISPqZ9rOTkCzqt0STsuoV+h2hp300BFx3GcAP05k5jcveR+4i0BSDn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517940; c=relaxed/simple;
	bh=BHVUvKC8fABgwhFbsCtn+x//MI+5CzCso5niKHdPfwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdn0gP7izU6+cqZkmdPIdHigOn7TFKJA/PmcesC3eGxvhYV7Ze6xuaTIkX9XR74p+xEmQi0bCPt23LzKq6jwIxDLy95l6V/da7YmH6U1/oZjwF/h5yl/7fzSaAjIyLXQ0JOZvA7oMf8HCtQDYuU025NMPCW6CnspIEubuu8zadI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=rgF6JEu4; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="rgF6JEu4"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5177ad0cc67so27166741cf.0
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 03:05:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781517937; cv=none;
        d=google.com; s=arc-20240605;
        b=cCgFOopgaN9G004rUv1mT1u1D+gB54zwfkMpWB9o1EQzbbCyyncWj38wdcWcMtPADS
         b+RopwelqE6R6zSV8lnpRQz6uPwCXL6IY2XUNlkfGDxzcelp3SOcdRf+dwYjWbklj00g
         faoDXdQISuFuu9jrwrpLVU/twYvbiWDN0PL3GaoRfojFyO+g4nJdXZaixDP0KWh7Z4Bj
         ADnK41OjrOCxhbYiKYiYF4feqq80hpCY5DwM4c+PHLvH6yOSwPI0FRBDFUi300uOesTS
         OTulJxLQ8yvQwDX+l052lIh8eUr0eqAgj40P6t2pmPNQaEAGPg2VpjnMfD/4tJwNGTG3
         d4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RhfY4Pioqcz+QSX9s0uPtuJ24dF1j7SNWFHyFPAA9lE=;
        fh=w2Dy9MBCymTAHXuuQoFoyTRhGtZ+o5YcX5Bg6rpudfc=;
        b=VCgVOETbdwZhkme2+30IYgixnDLJcF5+xO1n9eB9rzUR3UzaWYkWtOMqoPXXMFIHGm
         SZ7Ps0vSKim1Q6/cqKtoWOJHzin9SzaACZuvYc6bnwvz+PfjOGSjgiPEV84EQDpUQRxS
         GyvSy3AwrPyrh6CQwET9Nuchlx2poMc5N2CG+f5n8iWaXQ7IFYM4w4NrxiC6iU3uCXC5
         iZI4maffG3XDMo1iILp3KNdcoQLBdbwLaUfn6Qv7QmWIS1IS+VCy8Ks8f+ETDKF2VdXG
         AINbIhbagqS7UVd2qg5shGa7+kqwCZMaSmYUJl7edyGn3AW/l1FJJq8FootD9zOopthp
         zYKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781517937; x=1782122737; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RhfY4Pioqcz+QSX9s0uPtuJ24dF1j7SNWFHyFPAA9lE=;
        b=rgF6JEu4yg3wnILRW3+kR23IaTzJOe3/C4SbPr0lx6Z9WVjEWy68he3o/in7OTVJbf
         NDt+5JRf2A/mY3nL2a5B3VzgKL7MNXUbTbgzBvKYm844buMvSuQLNUPEZ4vUL52nC7Ge
         4N8EXUrCfuUocj0Xt3YYfG0cT5Kk2qAM9pcYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517937; x=1782122737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhfY4Pioqcz+QSX9s0uPtuJ24dF1j7SNWFHyFPAA9lE=;
        b=n/fiNUUsQ/Rj4M3ze3O+CFvpS5F6H8euP2O8qFcCek42pWwEQKBhSx4hBimfPkoIl6
         OinaR+/rJniR2veBj1+sQn45RKgihglAk32ocgtgRYgjWIYGbxQ+b33Ed3E46V2x4cZW
         qS5MsfIXnRFY4D97PkSA7L3y59zI2SGcZ1bsHAPfVPtLrE66bqieEO0LM7e9R98fBoMr
         +ClnMvJpHumE4FGB83+H5yv9bUNARe+Xrv6UygMYcFSyI8BiSM0d7luA3LePAYL7rpSR
         YDAdM6fTKOizySgH4RTyN5oj8CSeLnilJEMbqNJ+lRLB5Km4CQswXKSmcg9N/LCpm/rm
         CbFQ==
X-Gm-Message-State: AOJu0YyxwUWlk9ut5vXEhwuK6wJlzccOH+op8EY9OMfBoG85JYlIsrSZ
	Hgs2fwcMumGojKxNh24xkj1FqnjW/db9avFM+gTPxxVQzV5t25CCJEVsvLB9G7VbeTUTxbEkg2r
	VPU++CXfotC1da+fyBj9DAJF5T1dEhVtLTQtqWPpayg==
X-Gm-Gg: Acq92OGwsW6KUnRaSS5/cODxr1GFKPFYzEC+G39BEQiaGKtpMIcerJJtX+TOHm70ak5
	gBJ7qnyJmOP4BuydVmPblDLYee6c/t5QEjPH9uHYTBJyKqetJg7MXE2V5RY/MNJ/y24YwBXWehg
	VcJbTX2A2nZcDPhY++et0A+Kcz2Jpo7TOB95M+t49xt63KPZdZKuifuR3i0YXy7yEqDDiL+YX9v
	Q+GfFx+SlTdvWndEJ+No5zkaDlVcuqSZsGSL7FCMD6HXuRxzClhZ9aQbAtZc8+3Ua0loPQ44/Bb
	CmhZjoADozEx3gVvXjozpZsnYYv/pzX2TcvxCDcS
X-Received: by 2002:ac8:7f85:0:b0:517:6ef7:f6e0 with SMTP id
 d75a77b69052e-517fe54f480mr198907251cf.46.1781517936808; Mon, 15 Jun 2026
 03:05:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com> <20260612210513.1516038-10-joannelkoong@gmail.com>
In-Reply-To: <20260612210513.1516038-10-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 15 Jun 2026 12:05:25 +0200
X-Gm-Features: AVVi8CdJA1UMgWAVT5KZMqPEr2y5VV1nJHnvS8aLSV1OKy8syIhfCGxH4CNOM9k
Message-ID: <CAJfpegs+EY+eCDOkBgVWhUyd8hBLE3bFY2oaum-k_tS=Cv2SVQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] fuse: add zero-copy over io-uring
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2026 at 23:07, Joanne Koong <joannelkoong@gmail.com> wrote:

> The request flow for the zero-copy write path (client writes data,
> server reads it) is as follows:
> =======================================================================
> |  Kernel                                   |  FUSE server
> |                                           |
> |  "write(fd, buf, 1MB)"                    |
> |                                           |
> |  >sys_write()                             |
> |    >fuse_file_write_iter()                |
> |      >fuse_send_one()                     |
> |        [req->args->in_pages = true]       |
> |        [folios hold client write data]    |
> |                                           |
> |  >fuse_uring_copy_to_ring()               |
> |    >copy_header_to_ring(IN_OUT)           |
> |      [memcpy fuse_in_header]              |
> |    >copy_header_to_ring(OP)               |
> |      [memcpy write_in header]             |
> |                                           |
> |    >fuse_uring_args_to_ring()             |
> |      >setup_fuse_copy_state()             |
> |        [skip_folio_copy = true]           |
> |                                           |
> |      >fuse_uring_set_up_zero_copy()       |
> |        [folio_get for each client folio]  |
> |        [build bio_vec array from folios]  |
> |        >io_buffer_register_bvec()         |
> |          [register pages at
>                  ent->zero_copy_index]      |
> |        [ent->zero_copied = true]          |
> |                                           |
> |      >fuse_copy_args()                    |
> |        [skip_folio_copy => return 0       |
> |         for page arg, skip data copy]     |
> |                                           |
> |    >copy_header_to_ring(RING_ENT)         |
> |      [memcpy ent_in_out]                  |
> |    >io_uring_cmd_done()                   |
> |                                           |
> |                                           | [CQE received]
> |                                           |
> |                                           | [issue io_uring READ at
> |                                           |  ent->zero_copy_index]

FIXED_READ takes an address, right?  How does all this work at the
userspace level?

Thanks,
Miklos
