Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4141D4EA
	for <fuse-devel@lists.linux.dev>; Mon,  6 Jul 2026 21:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783373356; cv=pass; b=gPJ/yoGjAkHFVOpKINLPj2OpxT4Xh1S1TbM609BpulEs2Y2zjsIqQa0UdokIxXqRiOSkVQgiH+8X4sSYzCkjQTwvY69uo8JeIwy1SLR6MNQ1YFN6rPC7gLDERf26t8X0iWOfIXc7IyBwQEHMo8adXJZSprHCgA4h0vMp09teWDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783373356; c=relaxed/simple;
	bh=ejtDMaJdQXxJ/SvynymwK2ueeJspq+S9GvRCUAy+T8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3/LveB1fqjSrW0Q9qbcItEURafd+XGUg6TABQ0EmU+BVE5KK+aMl9ByWBKgWXIx3S1zGqL1pGzH7+KYBbxiG/OX7dmCnzu5fns9g22ZrsrkrbWRDz5SBxR4JreufaAIJjAkMDidOhfY8U+VnpQKGvxnkM87Eab8cjFOASTZHB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yctse3mB; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yctse3mB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-475417f010dso1921167f8f.2
        for <fuse-devel@lists.linux.dev>; Mon, 06 Jul 2026 14:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783373352; cv=none;
        d=google.com; s=arc-20260327;
        b=DBYm77ggnCEGmPqPAmAHnP9eLwb7VJnXbXjlRZAzuNTKG50KQikr/1XTdfS9Z5+sUJ
         slPeljyvBCe6qI0fX6OPxqo+uJSk8z2O52H0UTFMjO+v3x2BWD+9FTi4oEGZCZgPfqz8
         T7AHf1TKGUaTn8mYbRLus33CY1kis4s8a37ZkZI0ltNq8DiWdfmAYpPQzrRDUmFyfvfH
         gwLGxdYnU0owW1yQy6+1HVEpKD7NpIAwMRKDcJSldQOAo3D7i3sWbr/aOI4lNkDGmqNJ
         eUphTkGLSjGF17IEwWJCVPmF8vYOjXNhNTOXWkEVjAxxZA9rCuPVEsIapOFjh8jX7pYw
         +kpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yV2xPTCF17xoiTfTi0rcuMy0VIBAYGpyV+M9+DsjCZI=;
        fh=g2++KCFymCNHZBSO0E13r1id6n8KVo9s4u7tgyFe4JQ=;
        b=CwS71g+ae5lo9VpykuMpd4ov8ioRO9vZVWfHMIkwWmIH/TrABYYI2teaRbLSLgXM1i
         7CHOTF7mu9R0tGLICsB8WZaxNCTVQggrOcY8nL3CqOdUq8kd5CE58ph+menDHKTB/AUD
         juzHpdm8ZwmJvcLr23kP2yCl9iJdC34C+w0ex4KQqo8JqyEAJo0mGaDVtdIBAKvFvR/r
         avXm5L+5Cj6qHuZkyL0FxIN9qanGhQicvMnDx4sEjH94W9jPDRDZYqykVzsKzUBOlKTo
         e6Loei3Nerl8wXMGyI0SZoNONBn6j34kvwjPACOyxahXgzXn3Po2q7JIdvX3u8U/6NwY
         GGGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783373352; x=1783978152; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV2xPTCF17xoiTfTi0rcuMy0VIBAYGpyV+M9+DsjCZI=;
        b=Yctse3mBMyhES9GZP1G7BuIbAHy2iwhguORg6ndx6KKAdKiwxvacVXzhnbpzThrVQj
         Wf7zkWAzy4PktBwYGGWm7nhPXK2ibjws5gAlzbHU1WdCHH88l0544K2r1j+H/cW7kSgw
         5zSDMhVxUHWBX45AP31bm4PAWLs2EFw39CoWuZDrD0QRJWpxzsQGixQQrz7bbLqHJBuw
         76L8mqmNy0nomWK/wRR8HSr/vRWfJUccwNU/VrDunTWLI1rFt/fZx4WMVmQ00jQUNJZP
         7Tk2PtyhpB2llJTbrUgka2h12g7oJ1PiTsjIfbmGvSoFJyR6krSuuNiKnIYge5+6iwYT
         0XTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373352; x=1783978152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yV2xPTCF17xoiTfTi0rcuMy0VIBAYGpyV+M9+DsjCZI=;
        b=B2p5y69TwqSVvVWdg6LbCjPA4BGEavGiNu/4FT4/+Rr6Q2m5k/NwWfvjZsa1KuPaaZ
         feRMi7tX6N0ipcCpODN+3J6K5YTzyAkgOuGW6i3b09CLIPBSkNS4lvsrNLIQZp+XhA+K
         mjpOgeLrkUWkl2AWY7hBbuAea+KrNjghTpdl2lsIhFl9lKor5WLr0xX3Hczlv0crEG40
         ba0Zv8nxbHT/24IzoNLb6hYUmOYSzeSnJLUozusWniBiJwRE+p8vTBNLj7qPlTjgYgh+
         l5I559S5gxE3Im59L/OwoOukdXvaHqShhDP9v2pzIjeXknbOlSwP3hnsRdlXMJOsHCe9
         VSmw==
X-Forwarded-Encrypted: i=1; AHgh+RrtI5Rr0AXQVhRnMwdCNRWCO7QhJdYxCln4ruqPSTjn6NEwZu+w0HVWOLCXM/YzI58omt8fLPd4ghP0@lists.linux.dev
X-Gm-Message-State: AOJu0YxDfg1i++rLPYRtFzRWsmZt7WB040B/g1LuLC7Q376tyMneTEZ0
	tyS49v+2Nczrd5Bkv4MZrFQPNQ0DP3QrMpf789a+5NbPTF9VSIfy531UqDUQ46RMkwRqgpLN4nq
	H4tcuezUZn5x6I1bzzMknS306wQ48Dwg=
X-Gm-Gg: AfdE7ck7YM7EOiV3WCyX+xnAVQLXVPyZcn9VCo9lCqMREpYgheDQYOoPww2/LLlRtK1
	X72J/Sdjv8cXMXGvP715+SYGROZYnp17Ak0phsmiATkAwd08jk+7MWyGYhOZ9r4MWpiq+zkiCXZ
	1VoqmxQpSC1HtUZN98DYAsAsgmUxeB5djNEekG/3sYD/YBFRB+YnT+HX3VrHVSVvIhsaD6S9WoY
	ue6RFy/qgyz3s6Q/XnrequTDvxWJwXjuFeFaf7GoWxrEIhPAa215D55aZGrOgPmDGFKnXrHmuPU
	HMb04wMV+OBODNT/Z4fK6eHpCJn4dQHnW2nkXt7/pxyRuWSm2rdk
X-Received: by 2002:a05:6000:461e:b0:470:258b:b20a with SMTP id
 ffacd0b85a97d-47de666aef2mr2350243f8f.10.1783373352362; Mon, 06 Jul 2026
 14:29:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706191309.2887515-1-xmei5@asu.edu> <20260706191309.2887515-2-xmei5@asu.edu>
In-Reply-To: <20260706191309.2887515-2-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 6 Jul 2026 14:28:59 -0700
X-Gm-Features: AVVi8Cctz9S3C3og57xfHMRSwiAL9HNQVcXwAkJBNWzNm0RaRb4KC_PHR3BqWaI
Message-ID: <CAJnrk1Z8uS=ZR9HPeuuUiHUcydE6OW9WkmnonqSchTnfmwhk+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] fuse: reject oversized payload_sz in fuse_uring_copy_from_ring()
To: Xiang Mei <xmei5@asu.edu>
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Weiming Shi <bestswngs@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 12:13=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> fuse_uring_copy_from_ring() imports the payload buffer with length
> ring->max_payload_sz but passes the server-controlled payload_sz to
> fuse_copy_out_args() unchecked.  A larger payload_sz drains the iterator
> to exhaustion and fuse_copy_fill() hits BUG_ON(!err), panicking the
> kernel.  Reject replies whose payload_sz exceeds the imported buffer.
>
>   kernel BUG at fs/fuse/dev.c:1053!
>   RIP: 0010:fuse_copy_fill+0x6c6/0x7e0
>   Call Trace:
>    fuse_copy_args
>    fuse_uring_copy_from_ring     fs/fuse/dev_uring.c:686
>    fuse_uring_cmd
>    io_uring_cmd
>    __io_issue_sqe
>    io_submit_sqes
>    __do_sys_io_uring_enter
>    entry_SYSCALL_64_after_hwframe
>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Reported-by: Weiming Shi <bestswngs@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
>  fs/fuse/dev_uring.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 0814681eb04b..f6127c230dd9 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -679,6 +679,9 @@ static int fuse_uring_copy_from_ring(struct fuse_ring=
 *ring,
>         if (err)
>                 return err;
>
> +       if (ring_in_out.payload_sz > ring->max_payload_sz)
> +               return -EINVAL;
> +
>         err =3D setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &=
iter);
>         if (err)
>                 return err;
> --
> 2.43.0
>

Makes sense to me. Thanks for including the stack trace in the commit messa=
ge.

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Same comment about stable@ as in the other patch - not sure if the
commit message has to explicitly include the tag.

Thanks,
Joanne
