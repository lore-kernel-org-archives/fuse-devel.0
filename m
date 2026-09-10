Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A87B3AD506
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063490; cv=pass; b=DaR5k2as6iqDDCR07SwptEAePQnAtITRIOdU1lMEab+nVtt/rUFaHqqqykhP1DW+1n+psORXzlp7UVOaJ6Tu2+/0p2KFRa+7d9Y6kOHn833D4PqjnBQyxefr+kUNuckDXaRU0gReaVVmNXAd+tueWzxmM5G65Z45QLT763XOKxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063490; c=relaxed/simple;
	bh=/JiSL9KtMYW39gs+t7l5GNFcMSkI1SwWlTIMXx+UrPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYvlnYQJ8z7RtrwkuT83xa7j6AeDKYd2BF0HE2mvVsc4tfi50eoNGbC7FtGX2/OTEq9GKM23RvsMOTdlJKCwwNjTgLNwFQP9Mtn+nnUglkEZ8fZKm2TGGuzgBSQO9VWNxugJQpzSEgwDOUhy0cM+K/qkLKNX1Z7FbiTUlh1MREY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIfFow+u; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIfFow+u"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47de0093c42so11865f8f.3
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 11:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789063487; cv=none;
        d=google.com; s=arc-20260327;
        b=nC+jCW74jk1Ya93fL51Zb/D2LZAgLT2ZLYxNdRs13b+HzS3K6N+FNOtLh20KeQZNgk
         Kix2pp3+u80sX0qNgXpV3mwzdo6Vkwt/tLH2lTGk2Bj6b5SUHk3SkoSS6hFubymXuCrK
         1fE7N4ihPbXtLQnRvCTOUU/A8i+VoplSFbEsiYtSMvRJ943hA2F9T1sOUIv5O5k20eMM
         0rLRTj/27zjmoMXr2LJJDPLeedzE4wh+UQf69Huol9Jxkd0su03e2811j/kTOlIOk+S/
         x44iPrZydBGIKJmux4k6OAvJ9+xJPQN5YvUvvjHCk4EN7axhXG8NFqSfHaelfiSqT8O+
         zJRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pmlSkBU7Yx6aRJKzEZrvFOirNAsuneJxXll9dWdAM0g=;
        fh=EASMpGR4KQKDO00AaAasws3tp4aR0byq25Cg0TUyt1E=;
        b=CT2RrQFHGBcE4abtwLd0X12WDNZ/5rlopbpBqgWf85nhrbaviIxUIIs3535/3IfJEi
         nbJjMzjA0zXSzhlWQt+u2oeLv59a/KeZDmX0eruZRfBNSoGNqhWzF8ssrW6RU81PITOt
         LthoFc5dVbctkL8AqT+R7D2PlMn7pCHsIU6MzGe4LZzE0AwSSgfv1eXbfsMDMHTIEPvO
         OxhNhdvxgFRtHI4+n8ex3zdf8jcTcoGb+TOoGcIN/nCE2m1+3+vej+s5djmf14MP+169
         n5klf8HaTWyESffB+VKbrp3CupYBpfKnxqpoxy+jkEi3YgUxAt+LocQdtZSgqsoA63Sk
         xQ7g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789063487; x=1789668287; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pmlSkBU7Yx6aRJKzEZrvFOirNAsuneJxXll9dWdAM0g=;
        b=lIfFow+uYnGCspbYL6oAkgX9Nk700T48YxuaYPdpDFEJHfG0VYkEHatCmNn5uYtCCc
         CUnVl5S9B3uL3DjWM3AUdc3rAmRzQEm5SfaavBqnkUIM/6DmnZgNJ+xQSiD5CrbbViVM
         vsXS9NfIbsZWVw7S5dEq+nTVMhWRbg2aK9oaOiVr1R8+nvfmhAW7foQ8RY6TuImV+iLC
         XRCHR8OBRhKqMFxyOwih2iJeoIAXVH417SkYn2epf0Hgcno0jg+nhywgJCz44EEG1M2q
         6V4GoGoZ5bmtYC+sl2nGL31dwIGop/MkwfJZ03zt409N8M6w5WaqIVRmGD0nQ0xw+Y5o
         ywVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789063487; x=1789668287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pmlSkBU7Yx6aRJKzEZrvFOirNAsuneJxXll9dWdAM0g=;
        b=A0uzqIsrCn6olvdkKE8uLdW5jas8O3zQ7G7G4zg6/Ziewq5Q8L0vkXafIfatLY9TXh
         aMSVSvvN7VAO3t4eIUYAkIxOLM8rnMmA6y2/D1KMTbPp24aSwJhNoxFgagezzqm2mOfz
         wKi+f7oLVXVkI5maOGqrgiGtxbmbpSdgFT3OVy00SPvLqvYWvwSl10F0wX4KsNS27e0N
         EJK+Q9T/KOqaOk7pBURGRIdc+6xXfihQKYxkCyFnflMtWwUM/ToGef1JIG9YNUsBLImA
         36FVXcTPqdpV1dwA37hOHN6ToO0KowvzTa8pxwNHuUgRnBAa9duXEuPGRgQ1SkP9+jvh
         7/Wg==
X-Forwarded-Encrypted: i=1; AKwUvBzwoKWpAzQY/9/vdEiRJQdAgxZCb+ydRnmCoORUtVC5vVfNOjnr3CyhgyMC86FyrYOOIk3uPa67DAi0@lists.linux.dev
X-Gm-Message-State: AFuF++nHicA7Hp7rQdvDt1btYxsOGnYUu1V6pilgwttYuzcTO1ABFirx
	7Iwjsvgsb8N2lVZjHhIuaAf3Vq4NuhFJLtGmKleiQMmBAP4AW9TkkSOyqJyxVkyxhvgwMif8h/Q
	7mqzXkvr6KF1o/k+Lq/voVDnekafmZH8=
X-Gm-Gg: AYBFou3HyWm7dTccNnietZW2nHSpcdYJPkSoe3moWsIpwRP6Sz7GEJ37EnzD3p95ETp
	HAe4muxxl5tI9HTqQtAoiynKIO3NRfiDtfWEUfwpSq2wTxf81jTjLxj/D8U5QJTLQaz6DABxuwQ
	SMxNWG4VEEkZy7sQQiMup+WUJOUbY7tiH5TkfJGpRCzg31LdypIpxojOVzeh3Fu34Gr2s4t6jbx
	t6azfzV5NHuLZuxlEJtwlcHNvRRh6HZ2tEgQwJQ+vDhVzP6uIO7ScpWCuK5tj4Aa0x32cJqxtn4
	1Bie0B6o39oA338zixjTXDevGM3a0n8rX0r/TS/kl1Fr/HPAenFqJ0utGI4yZ5APQl2D252DAiI
	e7r8JM+u3W3HYqNcbjumL39hh1uUcLq3rxTyKlA==
X-Received: by 2002:a5d:6f10:0:b0:485:8c16:5ef8 with SMTP id
 ffacd0b85a97d-486eb3104f1mr167913f8f.50.1789063487446; Thu, 10 Sep 2026
 11:04:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910022442.3594649-1-xmei5@asu.edu> <20260910022442.3594649-2-xmei5@asu.edu>
In-Reply-To: <20260910022442.3594649-2-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 10 Sep 2026 11:04:35 -0700
X-Gm-Features: AcwNN1UPtHpn5Ju1AbUXHO7M6POxnBVC4rOVn1G8Fc3LCftjvo7b6-mIt_6WkRg
Message-ID: <CAJnrk1b=WoRPqKLEex-WuTVxjjw95Aj77Azwzv=BeR9VTu4PSA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] fuse: return -E2BIG for an oversized SETXATTR over io-uring
To: Xiang Mei <xmei5@asu.edu>
Cc: Bernd Schubert <bernd@bsbernd.com>, Baokun Li <libaokun@linux.alibaba.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:25=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> fuse_dev_do_read() answers a request that does not fit the server's
> buffer with -EIO, except for FUSE_SETXATTR, which gets -E2BIG since the
> value may legitimately be larger than the buffer and setxattr(2) reports
> that to userspace.
>
> Over io-uring the copy fails with -EIO for every opcode, so the two
> transports report different errnos for the same condition.  Map that
> -EIO to -E2BIG for SETXATTR.
>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

> ---
>  fs/fuse/dev_uring.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index c6dd420c4034..6351f2470e09 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -893,6 +893,8 @@ static int fuse_uring_args_to_ring(struct fuse_req *r=
eq,
>         fuse_copy_finish(&cs);
>         if (err) {
>                 pr_info_ratelimited("%s fuse_copy_args failed\n", __func_=
_);
> +               if (err =3D=3D -EIO && args->opcode =3D=3D FUSE_SETXATTR)

nit: might be worth a comment above saying something like "fuse uring
doesn't use pipe buffers, so an -EIO err can only mean the in-args
didn't fit ent->payload"

Thanks,
Joanne

> +                       err =3D -E2BIG;
>                 return err;
>         }
>
> --
> 2.43.0
>
