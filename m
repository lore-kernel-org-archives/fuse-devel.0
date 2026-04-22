Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEF337F75B
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776880442; cv=pass; b=m3n6y2roDXW1OpkUvklZSLO/Ynj47ADSp10T2N87ljhLSvLWFlpH2689MCweYZSmrJ8PkpTHmGqUaykX/QiwW9k9C71NDHVCR436eVjqTsOq7IFWdbtFjYHvHqaLyiQJvGF0qJJHNo0nk+TpdrM8FPik65yIsHygA8O9pjxNpzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776880442; c=relaxed/simple;
	bh=xy1B9rmgyFzMWJqr+hi7jhwQB2TmZLPGlpFyD0Hwn7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nbqFcWiYS5WWn51O/2optRtAm67GeT3j8aH8EeL1eufg2XvHWIYwj9xnJZt8n2/YWGu9vRHu9DFr5bKwIoGQ52/hKOZqFxmPip0ZXX3zC/vXdl3WtgH8m6gjsbN6guLycBQpuqNVXLrpzZ84CZfXSEB+1RKWWMWvxLkBefLwvL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LfAmBBpT; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfAmBBpT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so3835031f8f.0
        for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 10:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776880440; cv=none;
        d=google.com; s=arc-20240605;
        b=N8lcmX4XB4XZQZqKJANu9tG6ZrgW40fABfGrwQtZ/avO7Tkcm96MarmyxVt9BO4MhJ
         demlo/Dmkh2UVhOXfDRTb83fjAS/BCVuuwbcrUnhE49/aheNj2NPanEAW0pvhSOSoKHu
         ndSxKzP9EfV9WL6eY4wV6ZSTzl27xnCoznOZiaFm6PLuW2JRJua+nSYmjMdHVhSwVtQ4
         csqySnBgWKfYo3eeXIxZFNRaaxY55ZX9YfoSW268B0Un6s4+yTRFFC8w1hL1ry9EYusB
         hseyryBN70lvt2vqnGXK2jykhv1TrCXLZpFvjwKYANVG2Q5s4GHkDRaUaIswy0UYYNwx
         vIsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y30SCp7FuLogLWh8oYupZiUPSYbwcxMLbbmd2lv3jDU=;
        fh=oSLQBSy3sy+srs416Fb9Ll8GcR+naHymI7Ry1FvZYFA=;
        b=cani5qknrH3Gu6lZ+TMOStM+bjxmAwQqBRqraPpldBnHk9jJX4uuUSZ8nAunUGirHQ
         Bvy5dTraHHgBpb3F5ngaJx/aZ5OQ7E1L5Ev3w2iymH0gm8CLCcS36mJWFcUSxFTos/ZP
         tUgVVPdYjO/5cwz/PvCpVFZeoiHkE96Pg7NCChJwiVriq5Ca8+t9uRjWwKz+n5I/fyOt
         BjHSTOdfqwq1In8ddpati7NhGCcZYisZNPh4n0VZXd3nMHYJZxIXd/ZOhTheeFs0MaHp
         WZ6/2+gQvyhBgqh8SpReKTG5mPQDgGyd8uOqpMzKcd8So0Lj5cdHOepMTPV9yyqVDl8t
         g2OQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776880440; x=1777485240; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y30SCp7FuLogLWh8oYupZiUPSYbwcxMLbbmd2lv3jDU=;
        b=LfAmBBpTZfUyWXZ0rGTrViYw1fHEmkTJgtanlTpLWETa9nS6ohTyffIEXU+qpfkmTR
         yGznEBGh+ZC1sepcIEcE7BpFcwsos4NHreYymUkYmwRESlSCUwoWekZdz73j7uEipJe2
         5XWJRcnLLxnGSuY4/6MH1JWZrAO77GgY7GnVEAOyUJnDk88GK/3wjDl4suaXx2GA+R5q
         HQ3DD17bp0ZUx9axVMGEbcENDPm1TO/2mOa90l80beXlMiSDK9cx6HYhoHOx7M0sBT1o
         4LeRbRdMHm7huyha5uRrLmpPpMA6PbZgDyT0/PuYwm7OZup1+NuissRAuWBmvcOQimV2
         +kKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776880440; x=1777485240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y30SCp7FuLogLWh8oYupZiUPSYbwcxMLbbmd2lv3jDU=;
        b=e7xERYnL0NQ1AT3CThYcyDBaxPEnyQS/ggxyOSdzMA9A+BOhjX3v7WPK0jJe6GxgiX
         ODsi+PPZDnYx3LwdjE9WHI+cYUJkhp5dPX0f8us9xOWW/JTD1YunxtL99oPHlmaGWwCR
         g0qvjkYsEwMCpj40ehOx5hJDYobInSun8vGZJO2wcWYZGZjeoiFtdE7BDxCh31IJG0L2
         MWc8ilW2kcoiphsGZuOdO14520O9UYP3+6vkPksjmmzhzvwTzOdaKDAb3l/HNcBgd5Um
         0iVLoLXDUR6fJwjkQaWm65W7U2wOQKak40jcfFcvZfIzH/TGw0e2JPcEOH9U5DZVEeiK
         QnZQ==
X-Gm-Message-State: AOJu0YwU5R2Bw7QvfoLRPxMBOSG52b4CZgcoXWEY8B9GRWBqxINR6ZOO
	srO4D8HjXYynwlIIiq3uGRWfBTYC5nH+nBSO5pDZ/RvQMsn8ga+wAkQKn7i1+czDdZxqhOvsUee
	dXqp2OcxHAauAvy/Ays0HRn71fjt6uRY=
X-Gm-Gg: AeBDievJ5iHYUo4m1WQ1yg3GHQZvs9F0QLq/Mp/Eh4EQhfrDEc6rFqbe/GKjbPL/WOx
	Wpw+OEQvZljw2FR+UJKGiGNyXr4Zekj9K06Al8xdn6XRmKDbI6KOaJtauQnXIEP9W/QUX/RKICk
	OdG0DkE3HanTpHDA1qDhnZcdOroux7GfwqJkj1QQoftvzpT97VdnTA0tEsk1Ia5DMRcUtWLlHW/
	8yPB2GYb4Bjc68XUb5WY/39S8ARWaZ/YmiKvOi6vu2kDpgulszMPELqBoJvLCOMSMA+yC0ryiCK
	us7msOtsHV8iHhOY
X-Received: by 2002:a05:6000:2890:b0:43d:75ec:26f7 with SMTP id
 ffacd0b85a97d-43fe3e08f96mr37017012f8f.29.1776880439620; Wed, 22 Apr 2026
 10:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260416091658.462783-1-mszeredi@redhat.com> <20260416091658.462783-7-mszeredi@redhat.com>
In-Reply-To: <20260416091658.462783-7-mszeredi@redhat.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 22 Apr 2026 10:53:47 -0700
X-Gm-Features: AQROBzBjMac6YzBfh2mO4YHPH0rWTjIMw3YS_LPPCnXqypGc-Uq1LPnDyaTChgQ
Message-ID: <CAJnrk1a+wEqZxgLDYJObfGiAiW=SgVvV4LgR6_PnwwW12t=1LQ@mail.gmail.com>
Subject: Re: [PATCH 06/32] fuse: move background queuing related members to fuse_chan
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2026 at 2:18=E2=80=AFAM Miklos Szeredi <mszeredi@redhat.com=
> wrote:
>
> Move:
>
>  - max_background
>  - num_background
>  - active_background
>  - bg_queue
>  - bg_lock
>
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/control.c     | 11 ++++++-----
>  fs/fuse/dev.c         | 45 +++++++++++++++++++++++--------------------
>  fs/fuse/dev.h         |  3 +++
>  fs/fuse/dev_uring.c   | 24 +++++++++++------------
>  fs/fuse/file.c        |  5 +++--
>  fs/fuse/fuse_dev_i.h  | 16 +++++++++++++++
>  fs/fuse/fuse_i.h      | 16 ---------------
>  fs/fuse/inode.c       | 16 +++++----------
>  fs/fuse/req_timeout.c |  6 +++---
>  fs/fuse/virtio_fs.c   |  2 +-
>  10 files changed, 73 insertions(+), 71 deletions(-)
>
> diff --git a/fs/fuse/fuse_dev_i.h b/fs/fuse/fuse_dev_i.h
> index 459f37ece46a..efc321b2bf5d 100644
> --- a/fs/fuse/fuse_dev_i.h
> +++ b/fs/fuse/fuse_dev_i.h
> @@ -93,6 +93,22 @@ struct fuse_chan {
>
>         /** List of device instances belonging to this connection */
>         struct list_head devices;
> +
> +       /** Maximum number of outstanding background requests */
> +       unsigned max_background;
> +
> +       /** Number of requests currently in the background */
> +       unsigned num_background;
> +
> +       /** Number of background requests currently queued for userspace =
*/
> +       unsigned active_background;
> +
> +       /** The list of background requests set aside for later queuing *=
/
> +       struct list_head bg_queue;
> +
> +       /** Protects: max_background, congestion_threshold, num_backgroun=
d,

nit: should this comment be updated to remove "congestion_threshold"
from the list? congestion threshold is accessed locklessly.

Thanks,
Joanne

> +        * active_background, bg_queue, blocked */
> +       spinlock_t bg_lock;
>  };
>
>  #define FUSE_PQ_HASH_BITS 8
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 6185b97df106..ccf0db3a4eeb 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -566,25 +566,9 @@ struct fuse_conn {
>         /** rbtree of fuse_files waiting for poll events indexed by ph */
>         struct rb_root polled_files;
>
> -       /** Maximum number of outstanding background requests */
> -       unsigned max_background;
> -
>         /** Number of background requests at which congestion starts */
>         unsigned congestion_threshold;
>
> -       /** Number of requests currently in the background */
> -       unsigned num_background;
> -
> -       /** Number of background requests currently queued for userspace =
*/
> -       unsigned active_background;
> -
> -       /** The list of background requests set aside for later queuing *=
/
> -       struct list_head bg_queue;
> -
> -       /** Protects: max_background, congestion_threshold, num_backgroun=
d,
> -        * active_background, bg_queue, blocked */
> -       spinlock_t bg_lock;
> -
>         /** Flag indicating that INIT reply has been received. Allocating
>          * any fuse request will be suspended until the flag is set */
>         int initialized;
