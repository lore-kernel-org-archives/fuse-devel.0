Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54FA2D7D47
	for <fuse-devel@lists.linux.dev>; Thu, 27 Aug 2026 05:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787809496; cv=pass; b=iM+/IUESHf4e23Eqs10H+bF9yl9HFifiIj7Kr5ZKwypUc/fOesRSwYMdgsXyjJw8J59QNHFBAH+oagpL73xAFVFwWkGvIaZ0+UqPH3kJDRLTF/g+fNeH1ZwUDPeFgJeSbZMFAgxiERD5YniNuOgOsCZ+gkBqdjnrrUgn+ImIsZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787809496; c=relaxed/simple;
	bh=omU7MleAS3Oge+B2cXMiAanr3cQUH5UCSgbQaeEcyhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtzD3gUkTlBqRGh/pprM4Mozf4E6eF1fmTX1u6l1r2fHlKPF5Z05hbF3xMAlPG8UAZP8fRlriAnlRNb0P3rkuu3U0+5tBvkKc7drysYEUmla4866JR/iuuD2KEyuwc30UH3olIeeiymwjVfEU/Xto7Pcj9+xrE/k0T5fAWCRZ3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqLfH716; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqLfH716"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-85a50f6a7f7so15751727b3.2
        for <fuse-devel@lists.linux.dev>; Wed, 26 Aug 2026 22:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787809494; cv=none;
        d=google.com; s=arc-20260327;
        b=mz8dRuXjakz3ffqV+P6/RN89mERZ29nvUbvcPbX/uX/R2upUzKnZPPM/Uf8LtzP1mF
         4IwCco7ddN/Eh4icnSWnPeYTMQNSmXyhFybEqKR35xCahxg0zWXw39EX0SHE64+873h6
         NwhJj6QvkFD0DthepGtZ9JzPQBFfmrrThbDDFi9bCgI8xdro7+xBGsy5vzgvXdTM4gWx
         xFvesRS0dPv7We7Jlf035KMPhmVeM5NU3R7R8d3HqyqXVcjZuxb3e4yLl953jde8XQTW
         +kiSOaw6ZEbQ/NIx7RYpoMhHsyBUFo50FC+oM2V1R5grOsLCQIYJjNez9caCq3Ezpup4
         nGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5I4e3+ZwrBi85nvROZN+HVLgsbxHatTVihnyTQvBXvA=;
        fh=aA8gygQ0T54a2WN2E6Qag/vRmfzCYmdNaUxzi4XDCnU=;
        b=p9pKvW5Td9YQq59KZDkC8Ga5oNdhSLemVpzu0n0JuBNUqVp0ZEX1hbmfeAxqsWqNFc
         XcEVUOMFkZcU5+Gi35vCJozMSOSaax+yUGIvE6FjLXvOsfg50SzLHHdnP8zuJPGktSLZ
         SpzRPYTvjThp/Hc6hrgxcZnrY9Z2o7RHn1zvGj65WTSE1hV/Zjapa+lL8Zu0D/SHhSAz
         HDzdJ3Ppiy3Fj+EHS/kwD/ct/UFaUcTqsXEA/HF3/5Ik0TSifVLHv3/5bkWqMQ8IUC/n
         HQxfh657P1VA4OGuxdzaOgaQvQzA11HITizFLvBpkbJ5ew8uqyLWONu7ln92odp1fGKj
         t2Fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787809494; x=1788414294; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5I4e3+ZwrBi85nvROZN+HVLgsbxHatTVihnyTQvBXvA=;
        b=XqLfH716vmYW07SHb+/WjF2h4hUAT+nG6Q87dQKyq/pBbHccA3n767eKetC06orwB5
         EmK2QDZtFMVvVemeX/XMhnHpGqYRDUmmkkhEeDUGmcYeaGmSjpuROOWBesJaxUKlBZHs
         KmKW3UxjnYDCWVChSc1w0tumSA1l/sW8c5gI1VE2a6bPyVIGZE9jx0uU6f2sSAzI/jOu
         hEFJAtroC+ps8ZVHpHwaS/2w6DTQVhl54RlfiqZQ1aWp09AtKngka//yKVliWM3q4R3r
         j82YNq4TpzKeSWbG6wkb4YuQv3fr9XtOT26ftsMD562JBLw0wEN+DxDNnE8MRZS7Rhpz
         xafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787809494; x=1788414294;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5I4e3+ZwrBi85nvROZN+HVLgsbxHatTVihnyTQvBXvA=;
        b=MZFCN+WOHGqWAOXGtBAWpESu2hPL4r6M82Lga4M6lNZVRMaYfxxE7GYWJB9skK5Iqx
         be/JeEAQ3MeyKF5vsxtZf1HYwmUkH3acMWI8mzLgSfbQZsim0ajpSwGYifdEjgxb5GKc
         d2+ClYn4DSosjkHNm4FWng7tT2l/ZXjiHxev4DZTaVkO92LiZsqgnDlGB9X3Ok0I6sv7
         SZbQtPleZ0A74q4XqAEujpinn2vha9YGWj9+L2AgfZ+yFQsQnDL8IL7RN0zHKIKpLhOv
         34jiF/FcmgrOehbAsI2mQQWE2kUfb3g7ekd2wOt4cNWTaa1djbEPTKegq31bjYWTMz4j
         8uQQ==
X-Gm-Message-State: AFuF++nk2a2x5n5Mp2xeF+6DbRk7tZScYeSyH5XM+Z/SobR13rgWWQGd
	+yddsqpBk3uuNuKIOIX+MvdPrBrG5ihfW2dw9XKn6WGRNGkUMiRVj8Gvy7FeahBwVx9gLHIfBRT
	TMACghFbIgWuIrlRPN2o+cwCLOwciE/E=
X-Gm-Gg: AR+sD13OWc4hQJNyPI4M+N3KkxGWIrS7aY581YDgGRMxcyBrm7xzoGDQR44YwU7r2cG
	uFi6oUlXyiFkV9KUMtjG2cD7vQBdj7IkNkO55S5kfU31osl2kPZGrhygGI4tGab/LXhVLntuCQi
	p84v0nmBiAoTEk5nfiMELeT8nFFjbcn7Hea7WRiIzSEU25QnQc+GiVNjOirbU9tVj0R5dZ3nSj9
	9cY61SczZIjyoBSgU5TGjbx5FUEHgBy8izavlnVKCUp/vP5AtJJ8EmKABw/NNogEcl/KV3xx660
	DUa2+iTKTidb/LrrYvaEr9r24L3GrWjH3y6/Hp0o5bvWxerYwusE9fO/n185JZHej/dBWeKAtk1
	A8BSZ+krwFjzp
X-Received: by 2002:a05:690c:6311:b0:816:b469:cd12 with SMTP id
 00721157ae682-8573cad05f0mr57112917b3.8.1787809493775; Wed, 26 Aug 2026
 22:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706025705.58301-1-laoar.shao@gmail.com> <CAJfpeguGzyVctgBRp+JFzs1ohzHG7hZ+EwRokE_yX0w-zJNyMg@mail.gmail.com>
In-Reply-To: <CAJfpeguGzyVctgBRp+JFzs1ohzHG7hZ+EwRokE_yX0w-zJNyMg@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 27 Aug 2026 13:44:17 +0800
X-Gm-Features: AcwNN1U_82XoaaN5de6E7Yv9WtDhpzTenm9z_I6eunkc0m3D8-JXY_IfgsG8Tmg
Message-ID: <CALOAHbDn7NK8cA5c7NmMTfJ5zX0FmJNBM5_mKUDv8Vfjx5M4RQ@mail.gmail.com>
Subject: Re: [RFC PATCH] fuse: fall back to copy_splice_read() when i_size is zero
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 10:24=E2=80=AFPM Miklos Szeredi <miklos@szeredi.hu>=
 wrote:
>
> On Mon, 6 Jul 2026 at 04:57, Yafang Shao <laoar.shao@gmail.com> wrote:
>
> > While the proper long-term fix is to upgrade lxcfs, the kernel
> > should be resilient to this common FUSE daemon behavior. Therefore,
> > when i_size is zero, fall back to copy_splice_read() instead of
> > filemap_splice_read(). copy_splice_read() calls the file's read_iter
> > operation, which sends a FUSE_READ request to the daemon and lets it
> > generate the content dynamically. This is safe because for genuinely
> > empty files the daemon simply returns 0 bytes.
>
> Thanks for the report and patch.  Naturally the kernel needs to be
> fixed in this case, the no-regression rules makes that mandatory.
>
> Can you please try the attached patch?   This is actually fixing
> behavior for FOPEN_DIRECT_IO, so if it fixes the regression that would
> be wonderful.

Thanks for the fix. I've verified that it resolves the regression.

For your patch, feel free to add:

  Tested-and-Acked-by: Yafang Shao <laoar.shao@gmail.com>

BTW, below is a simpler reproducer for this regression.

#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <sys/sendfile.h>
#include <sys/stat.h>

// lxcfs without commit 25982f5 ("Set the file size to 4k")
#define LXCFS_PROC_PATH "/lxcfs/proc/meminfo"
#define MAX_FILE_SIZE    16777216  /* 16MB */

int main(void)
{
    struct stat file_stat;
    ssize_t sent_bytes;
    off_t offset =3D 0;
    int in_fd;

    in_fd =3D openat(AT_FDCWD, LXCFS_PROC_PATH, O_RDONLY);
    if (in_fd =3D=3D -1) {
        fprintf(stderr, "Error: Cannot open '%s': %s\n",
                LXCFS_PROC_PATH, strerror(errno));
        return EXIT_FAILURE;
    }

    if (fstat(in_fd, &file_stat) =3D=3D -1)
        fprintf(stderr, "Warning: Cannot stat file: %s\n", strerror(errno))=
;

    sent_bytes =3D sendfile(STDOUT_FILENO, in_fd, &offset, MAX_FILE_SIZE);
    if (sent_bytes =3D=3D -1) {
        fprintf(stderr, "Error: sendfile failed: %s\n", strerror(errno));
        close(in_fd);
        return EXIT_FAILURE;
    }

    if (close(in_fd) =3D=3D -1)
        fprintf(stderr, "Warning: Failed to close file: %s\n", strerror(err=
no));
    return EXIT_SUCCESS;
}

--=20
Regards
Yafang
