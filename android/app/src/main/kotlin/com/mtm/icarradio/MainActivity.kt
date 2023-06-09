package com.mtm.icarradio

import android.accounts.Account
import android.content.*
import android.os.Bundle
import com.google.android.gms.common.GoogleApiAvailability
import com.google.android.gms.common.GooglePlayServicesNotAvailableException
import com.google.android.gms.common.GooglePlayServicesRepairableException
import com.google.android.gms.security.ProviderInstaller
import io.flutter.embedding.android.FlutterActivity
private const val ERROR_DIALOG_REQUEST_CODE = 1

/**
 * Sample activity using {@link ProviderInstaller}.
 */

class MainActivity: FlutterActivity() {
}

class SyncAdapter(context: Context) : AbstractThreadedSyncAdapter(context, true) {

    override fun onPerformSync(
            account: Account,
            extras: Bundle,
            authority: String,
            provider: ContentProviderClient,
            syncResult: SyncResult
    ) {
        try {
            ProviderInstaller.installIfNeeded(context)
        } catch (e: GooglePlayServicesRepairableException) {

            // Indicates that Google Play services is out of date, disabled, etc.

            // Prompt the user to install/update/enable Google Play services.
            GoogleApiAvailability.getInstance()
                    .showErrorNotification(context, e.connectionStatusCode)

            // Notify the SyncManager that a soft error occurred.
            syncResult.stats.numIoExceptions++
            return

        } catch (e: GooglePlayServicesNotAvailableException) {
            // Indicates a non-recoverable error; the ProviderInstaller is not able
            // to install an up-to-date Provider.

            // Notify the SyncManager that a hard error occurred.
            syncResult.stats.numAuthExceptions++
            return
        }


        // If this is reached, you know that the provider was already up-to-date,
        // or was successfully updated.
    }
}
