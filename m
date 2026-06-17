Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D9F239E7E
	for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 11:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697439; cv=pass; b=GA9yg8OpVIttJ9y3t2ftn+jBFCG6gnXQpIVvoLOg1GtT6nhFIwQXpFQvbIYzEHbgRQztIm8v8Qz04L0hggurlQLM1J9GVhCOy+9gk2rt7duGGKDNS69hmHTmJcQtQ9/3cnJh9SkzeP10Wl21R2MgJUfIZB563DrNo/ZvZ2beTKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697439; c=relaxed/simple;
	bh=nX7BLRamd+LaL1zUnJb/ee7PUAHrRE2KQnDK8l+Etig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sz8Nu2H1eEkwqrzAiwr+1Vndn8tvDwGELu+IYQ9xMtKQTrEy529rQKb9H0M681sMY8sOg8mmkDdlQbFvCx2MZaaKdAie7AT2m3mA0HsUg6QAgHrIbibcR1CG5gWMWO/LjlT/rv77HQsGN3iQlRNvwx61q8DbuXGvrv0IWT31dZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EloG3+q4; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EloG3+q4"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490afc47455so25751955e9.2
        for <fuse-devel@lists.linux.dev>; Wed, 17 Jun 2026 04:57:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781697436; cv=none;
        d=google.com; s=arc-20240605;
        b=Gs83bMNr4MwqHDTK9mXoq6GrQyW7xNlL9Rcq8sCR8w8uTSUpSmyOs2NvCmvlO3YzkG
         Ar1/2kHWGpOJrvAESX5+dRqtLprwEHEhUlKsZpmrfp6TB5cge7XjuRA4ERJp+nTD3ZFC
         5ZnjohKx+lXCppJlcEuOzxNH7f3vpS+sBmAFTnDSA4d1hRydJV2Evku3npoetm2LC7Ky
         Aq1hRD1joZc6+hLMJtWHXCnOVHCVojBdtiijCAuxvUCw9KwKIQzaYV5eHJOwTatiBoRd
         NpmoX/rIdNOohCg4/qYNhd5RsLBd6rsmV3oSITzMxA9Q197N5jSoJsir7Ahgw18Ak7xs
         ceWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hacy/NxzMzb77Kg6/ZNVlBD5NG85XNFqmfkrC3m9ou8=;
        fh=8bUFTemOwDoWiOdOkdFFPfADoT45yqq3f7053C+zN1s=;
        b=KRyZ+tqzUTb3aJ+Pjv2klU92loW3BmaJJ9DHSh4CBmRD7fJ+vu1ZG4lE7OOmzTGPdQ
         nJshKCrdcD3KfXD7a19k/2zmfhcaZogkAPmzPuBwK6DebeWnn6l2CdE7uGNkkykzqlq/
         JC7lzyJT3reD6MZob0APTW8fj7hkdWASKMNqC/gJL5saK1ZABbTl+BJVDvtajvQgvwJW
         tvmCHOCl9nzx3UeA19QSjZ5iMspeaQtIwPipj8jU/kk3dVQuoqE1+dV44UaHmJULSKma
         VGr3FdHq5vZPH4uBtoyhiod3KIfTxwH9sZESJKWwZ7O1o3QuhACEU+wPk//G1M3lKCig
         f1CQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781697436; x=1782302236; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hacy/NxzMzb77Kg6/ZNVlBD5NG85XNFqmfkrC3m9ou8=;
        b=EloG3+q4h8W2qzqhpMkscp2nMpHO+b/zRHQKHM9CX/kfCUE0y7Mae8qBCFOWCbqWS8
         Aj8Ca4cedg6b6tgDju1Va72GoWxypNUq6uCVYfAye+RP15dIZbBgo+NR6heCk61H5mXn
         6N6DjFShoiZndLAENFHFSHb1LVwWoEmKaEC2MSDbyoZcgZWMc70TltRW4EDQmsmNLwRN
         QyQhwrpR03wqXOByt6sjwwTHnF/lo3J9rATbbnP7dpkKQQ6LQKQr66fiWHLTGjY5WYwr
         c6aJGrP/XPgVfHtbhaSBrDvpH82j58k6EGSD1wYttuscU6TZoeWDc2kkWJAEHvdDPxRD
         gusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697436; x=1782302236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hacy/NxzMzb77Kg6/ZNVlBD5NG85XNFqmfkrC3m9ou8=;
        b=UsrgrQQGnCcYaLbRYVNSO3dcI4b9K/F0t4NrseswrZ2AZyHVJaFLKH1lDYp81S1JcA
         UWQpKIgGKlGXv2E6BFjXI74BGrzF55geDz3pN0W5U9CgCD/+JYeSmCQfXSskovs6pMAA
         TR+oAqcE0dTRab6lBmnNxoyqaX4o9JWmI0XDKL24YL2N7MjreNapQ6CmpU6hLrCRrDkM
         Do9i23cD5YP77NR2og1PA2XK+Jzh6K/QFYEcHX7OTMt5HuzROwwE3m1Xjr+0D7G3zXb2
         qrrFmh6DL9Ns5GmPvuZNXZMBRShKn7fkmo/fOP9cR5XEIExiQ9QhDkjvMTcxL9cdEeDP
         aSIw==
X-Gm-Message-State: AOJu0Yz+lwc+fEUTCjlEIGD7uJcBu9JrKLxmDgtHGY5tLDTVwx6/HFcI
	VhETFObxZKzri7kPBwcYK0YWQ20y9Bgp+bhIkwwANMHtvaXWavmGizaUMdsghSnP7r5QwCN9dQc
	zN8WCkEy8f+WaGsqx++bYz2zALcRp2jI=
X-Gm-Gg: Acq92OF1qF0OHCFV8eo3X+dVjnDghXPp4a+y854rsAsKDD8cLQQrgXYqq1W0LNLOqDn
	qakc2iKBX6kCm/0TGOYLHHteg+z9N2KcNPwPZVY68i1/hbZgXxiBP1CK2ve2Qk1yM1hB7b4zyDh
	zTTzILizaecCMn9Tgmi3i2ViBXVWf2TnWa5DytwpwYWSyHaB1Pu7YDXU/CpKybRLrGmL1HwIYAt
	TNn03VZMO73c59Yr9wmSwswinXIlmyBbmTf647jLqa/GbIUkeWZ2B6yV0vVOob9mY1KHEga47+e
	033pBn5kVk0XbD/ESZRXb7xml4dz1V6R7G1yo/j0FFO/HetB/Hbk0Gfy
X-Received: by 2002:a05:600c:a111:b0:492:301e:3270 with SMTP id
 5b1f17b1804b1-492333af267mr57440475e9.13.1781697435501; Wed, 17 Jun 2026
 04:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612210513.1516038-1-joannelkoong@gmail.com>
 <20260612210513.1516038-8-joannelkoong@gmail.com> <CAJfpegt8sfO681aoixfCc2XvUP-OH50GVHG-vmF8Q3oGqxF9MA@mail.gmail.com>
 <CAJnrk1b=Mxy0N+QKjFZwb92arUVDRzz9PJVXvsZSmPq65bsbAQ@mail.gmail.com> <CAJfpegvfyawxKmL923ZwcTv8JNhCYhz-eXGQ=-b0bHgMSYW=Zw@mail.gmail.com>
In-Reply-To: <CAJfpegvfyawxKmL923ZwcTv8JNhCYhz-eXGQ=-b0bHgMSYW=Zw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 17 Jun 2026 07:57:02 -0400
X-Gm-Features: AVVi8Ce6Jf1kEkxAhLj7wP27D3v7s-ipzHX2UJvJZfoqC_E5hqt3oWG5HeovS3o
Message-ID: <CAJnrk1bSg6p5pEn1D=RT_9ZH65QpY21_QmyEQbEk27=tetDVzQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] fuse: add io-uring buffer pools (implemented as
 buffer ring)
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, axboe@kernel.dk, jlayton@kernel.org, 
	libaokun@linux.alibaba.com, bernd@bsbernd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 6:22=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Tue, 16 Jun 2026 at 07:38, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > The server knows the starting address of the bufpool (since it
> > allocated it) and it knows the size of each buffer in the pool. It can
> > compute from the buf_id the address corresponding to the buffer.
>
> But which buffer?   The interface is supposed to handle multiple
> pools, in which case the server needs to find the pool and the buffer
> within the pool.

If we later wanted to add support for multiple buffer pools, we would
need to extend the struct fuse_uring_ent_in_out to include a "uint16_t
pool_idx" to indicate which pool. Userspace would be responsible for
keeping track of the starting address of each pool.

>
> FIXED ops also require buf_index.  Things are getting complicated...

For FIXED ops not through zero-copy, there's one index for the entire
pool (eg this is the index where the pool resides). It passes this by
setting the sqe->buf_index.
For FIXED ops through zero-copy, userspace is required to register a
sparse buffer where the kernel should place the application's/page
cache's pages. Userspace determines the index into this sparse buffer
for the sqe and it passes this index to the kernel in the init setup
in the "uint16_t zero_copy_index;" field when it registers the sqe.

Neither require the kernel to pass back a buf index corresponding to
the fixed buffer index. For both cases, userspace knows the index for
the fixed buffer (it is the one who determined it) and it is the one
who passes this info to the kernel at setup time.

>
> > This would have to be returned as part of the struct
> > fuse_uring_ent_in_out. There's currently 12 bytes that are free to
> > use.
>
> Does the 12 bytes limit come from the cqe?

The 12 byte limit comes from the "struct fuse_uring_ent_in_out"
definition in the uapi [1].

>
> > Returning buf_id takes up 2 bytes and I think is better than
> > using 8 bytes to provide the buffer address. However, returning the
> > buf id makes adding incremental buffer consumption in the future a bit
> > trickier (eg the server would need to keep track of the offset into
> > the previously used buffer and do any alignment rounding up). Maybe a
> > good compromise is returning a uint32_t offset that corresponds to the
> > offset in the bufpool? The buf size is a uint32_t, so I think this
> > would work just as well as providing the buffer address directly.
>
> Yeah, offset sounds good, but still need to select between the pools.

For multiple buffer pools, I was thinking that would be through a
separate "uint16_t pool_idx" field to indicate which pool.

> So should that be the "pool index" that would be the same as
> "buf_index" for registered buffers?

I think we should just pass back "pool index" and have userspace keep
track of the registered buffer id that corresponds to that pool index.

Thanks,
Joanne

[1] https://elixir.bootlin.com/linux/v7.1/source/include/uapi/linux/fuse.h#=
L1255
